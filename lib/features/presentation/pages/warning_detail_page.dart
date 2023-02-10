import 'package:flutter/material.dart';

import '../../domain/entities/warning.dart';
import '../widgets/warning_detail_widget/warning_detail_widget.dart';

class WarningDetailPage extends StatelessWidget {
  final Warning warning;
  const WarningDetailPage({Key? key, required this.warning}) : super(key: key);

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
                padding: EdgeInsets.only(top:20.0, left: 20.0,right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(flex: 4),
                    Text(
                      "Chi tiết cảnh báo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(flex: 5),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              height: 41,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: _buildBody(),
            ))
          ],
        ),
      ),
      // floatingActionButton: _buildFloatingButton(context),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: WarningDetailWidget(warning: warning),
      ),
    );
  }
}
