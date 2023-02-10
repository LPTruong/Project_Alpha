import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_alpha/core/widgets/loading_widget.dart';
import 'package:project_alpha/features/presentation/pages/warnings_page.dart';

import '../../../core/util/snackbar_message.dart';
import '../../domain/entities/warning.dart';
import '../bloc/add_delete_update_warning/add_delete_update_warning_bloc.dart';
import '../widgets/warning_add_update_page/form_widget.dart';

class WarningAddUpdatePage extends StatelessWidget {
  final Warning? warning;
  final bool isUpdateWarning;
  const WarningAddUpdatePage(
      {Key? key, this.warning, required this.isUpdateWarning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: const LinearGradient(begin: Alignment.topCenter, colors: [
          const Color.fromARGB(255, 238, 0, 52),
          Color.fromARGB(190, 206, 14, 88)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      isUpdateWarning ? "Sửa cảnh báo" : "Tạo cảnh báo",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(flex: 2),
                  ],
                )),
            const SizedBox(height: 20),
            Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
            Expanded(
                child:
                    Container(color: Colors.white, child: _buildBody(context)))
          ],
        ),
      ),
      // floatingActionButton: _buildFloatingButton(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child:
          BlocConsumer<AddDeleteUpdateWarningBloc, AddDeleteUpdateWarningState>(
        listener: (context, state) {
          if (state is MessageAddDeleteUpdateWarningState) {
            SnackBarMessage()
                .showSuccessSnackBar(message: state.message, context: context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => WarningsPage()),
                (route) => false);
          } else if (state is ErrorAddDeleteUpdateWarningState) {
            SnackBarMessage()
                .showErrorSnackBar(message: state.message, context: context);
          }
        },
        builder: (context, state) {
          if (state is LoadingAddDeleteUpdateWarningState) {
            return const LoadingWidget();
          }
          return FormWidget(
              isUpdateWarning: isUpdateWarning,
              warning: isUpdateWarning ? warning : null);
        },
      ),
    ));
  }
}
