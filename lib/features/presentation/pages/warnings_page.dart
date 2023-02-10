// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart';

import '../../../core/widgets/loading_widget.dart';
import '../bloc/warnings/warnings_bloc.dart';
import '../widgets/message_display_widget.dart';
import '../widgets/warnings_page/warning_list_widget.dart';
import 'warning_add_update_page.dart';

class WarningsPage extends StatelessWidget {
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
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Spacer(flex: 4),
                    Text(
                      "Thông tin cảnh báo",
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
            Expanded(child: Container(color: Colors.white, child: _buildBody()))
          ],
        ),
      ),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left:10, right: 10, bottom: 10),
      child: BlocBuilder<WarningsBloc, WarningsState>(
        builder: (context, state) {
          if (state is LoadingWarningsState) {
            return LoadingWidget();
          } else if (state is LoadedWarningsState) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: WarningListWidget(warnings: state.warnings));
          } else if (state is ErrorWarningsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }
}

_onRefresh(BuildContext context) {
  BlocProvider.of<WarningsBloc>(context).add(RefreshWarningsEvent());
}

Widget _buildFloatingButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(15),
    child: FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WarningAddUpdatePage(
                      isUpdateWarning: false,
                    )));
      },
      child: Icon(
        Icons.edit,
        size: 28,
      ),
    ),
  );
}
