import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_alpha/core/app_theme.dart';
import 'package:project_alpha/features/presentation/bloc/warnings/warnings_bloc.dart';

import 'dependency_injections.dart' as di;
import 'features/presentation/bloc/add_delete_update_warning/add_delete_update_warning_bloc.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<WarningsBloc>()),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdateWarningBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Project Alpha',
          theme: appTheme,
          home: HomePage(),
          // appBar: AppBar(
          //   elevation: 0.0,
          //   title: new Padding(
          //     padding: const EdgeInsets.only(top: 10.0),
          //     child: new Text('Thông tin cảnh báo'),
          //   ),
          //   centerTitle: true,
          //   toolbarHeight: 130,
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {},
          //   ),
          //   flexibleSpace: Stack(
          //     children: [
          //       Image.asset(
          //         'assets/images/urban-building-skyline-panoramic-illustration-with-houses_288411-1 1.png',
          //         fit: BoxFit.cover,
          //         height: double.infinity,
          //         width: double.infinity,
          //       ),
          //       Container(
          //         decoration: BoxDecoration(
          //           gradient: LinearGradient(colors: [
          //             Color.fromARGB(255, 238, 0, 52),
          //             Color.fromARGB(200, 206, 14, 88)
          //           ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          //         ),
          //       ),
          //       Container(
          //         margin: EdgeInsets.only(top: 154),
          //         height: 30,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(24),
          //               topRight: Radius.circular(24)),
          //           color: Colors.white,
          //         ),
          //       )
          //     ],
          //   ),

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
          //         // ),
          //       ),
          //       body: Center(
          //         child: Container(
          //           color: Colors.white,
          //           child: Text('Hello World'),
          //         ),
          // )
          // ),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 238, 0, 52),
          Color.fromARGB(190, 206, 14, 88)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Spacer(),
                    Text(
                      "Thông tin cảnh báo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(flex: 2),
                  ],
                )),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
