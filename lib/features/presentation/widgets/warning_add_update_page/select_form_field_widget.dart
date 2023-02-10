import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/array/array.dart';

class SelectFormFieldWidget extends StatefulWidget {
  const SelectFormFieldWidget({Key? key}) : super(key: key);

  @override
  State<SelectFormFieldWidget> createState() => _SelectFormFieldWidgetState();
}

class _SelectFormFieldWidgetState extends State<SelectFormFieldWidget> {
  String? _selectedVal;
  // _SelectFormFieldWidgetState(){
  //   _selectedVal = CATEGORY_LIST[0];
  // }
  // String _defaultVal = "--Không--";
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedVal,
      hint: Text(
        "--Không--",
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Color(0xff353739),
        ),
      ),
      items: CATEGORY_LIST.map((e) {
        return DropdownMenuItem(child: Text(e), value: e);
      }).toList(),
      onChanged: (val) {
        setState(() {
          _selectedVal = val as String;
        });
      },
      icon: Icon(Icons.keyboard_arrow_down),
      decoration: InputDecoration(
        labelText: "Chuyên mục",
        border: OutlineInputBorder(),
      ),
    );
  }
}
