import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_alpha/core/app_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Alpha',
      theme: appTheme,
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Thông tin cảnh báo'),
            centerTitle: true,
            toolbarHeight: 130,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            flexibleSpace: Stack(
              children: [
                Image.asset(
                  'assets/images/urban-building-skyline-panoramic-illustration-with-houses_288411-1 1.png',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 238, 0, 52),
                    Color.fromARGB(200, 206, 14, 88)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 155),
                  height: 30,
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
                    color: Colors.white,
                  ),
                )

              ],
            ),
            
            // flexibleSpace: Container(
            //   child: Container(
            //     color:  Color.fromARGB(255, 238, 0, 52),
            //   ),

            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(
            //             "assets/images/urban-building-skyline-panoramic-illustration-with-houses_288411-1 1.png"),
            //         fit: BoxFit.cover,
            //       ),
            //       // gradient: LinearGradient(colors: [
            //       //   Color.fromARGB(255, 238, 0, 52),
            //       //   Color.fromARGB(255, 205, 21, 61)
            //       // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            //       ),
            // ),
          ),
          body: Center(
            child: Container(
              color: Colors.white,
              child: Text('Hello World'),
            ),
          )),
    );
  }
}
