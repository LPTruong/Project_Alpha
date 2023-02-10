import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleField extends StatelessWidget {
  final String title;
  const TitleField({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.5,
        color: const Color(0xff353739),
      ),
    );
  }
}
