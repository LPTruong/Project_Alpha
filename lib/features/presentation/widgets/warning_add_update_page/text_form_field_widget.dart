import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool multiLines;
  final String name;
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.multiLines,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: TextFormField(
        minLines: multiLines ? 3 : 1,
        maxLines: multiLines ? 3 : 1,
        controller: controller,
        validator: (val) => val!.isEmpty ? "$name không thể để trống" : null,
        decoration: InputDecoration(hintText: "$name..."),
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: const Color(0xff617882),
        ),
      ),
    );
  }
}
