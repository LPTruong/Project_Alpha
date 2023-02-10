import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_alpha/features/domain/entities/warning.dart';
import 'package:project_alpha/features/presentation/bloc/add_delete_update_warning/add_delete_update_warning_bloc.dart';
import 'package:project_alpha/features/presentation/widgets/warning_add_update_page/select_form_field_widget.dart';
import 'package:project_alpha/features/presentation/widgets/warning_add_update_page/text_form_field_widget.dart';
import 'package:project_alpha/features/presentation/widgets/warning_add_update_page/title_field.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdateWarning;
  final Warning? warning;

  const FormWidget({Key? key, required this.isUpdateWarning, this.warning})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late String _selectedValue;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _levelController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdateWarning) {
      _titleController.text = widget.warning!.title;
      _contentController.text = widget.warning!.content;
      // _levelController.text = widget.warning!.level;
      // _categoryController.text = widget.warning!.category;
    }
    super.initState();
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final warning = Warning(
        id: widget.isUpdateWarning ? widget.warning!.id : null,
        title: _titleController.text,
        content: _contentController.text,
        level: "Nguy hiem",
        category: "Thoi tiet",
        image: "Khong co ",
        createAt: "2/3/20222",
        author: "LPTruong",
      );
      if (widget.isUpdateWarning) {
        BlocProvider.of<AddDeleteUpdateWarningBloc>(context)
            .add(UpdateWarningEvent(warning: warning));
      } else {
        BlocProvider.of<AddDeleteUpdateWarningBloc>(context)
            .add(AddWarningEvent(warning: warning));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleField(title: "Tiêu đề cảnh báo"),
                  TextFormFieldWidget(
                      controller: _titleController,
                      multiLines: false,
                      name: "Nhập tiêu đề"),
                  const TitleField(title: "Nội dung cảnh báo"),
                  TextFormFieldWidget(
                      controller: _contentController,
                      multiLines: true,
                      name: "Nhập nội dung"),
                  SizedBox(height: 10,),
                  SelectFormFieldWidget(),
                  
                ]),
            Container(
                width: 311,
                height: 44,
                child: ElevatedButton(
                  onPressed: validateFormThenUpdateOrAddPost,
                  child: widget.isUpdateWarning
                      ? const Text(
                          "Sửa cảnh báo",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          'Tạo cảnh báo',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                  // backgroundColor: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
