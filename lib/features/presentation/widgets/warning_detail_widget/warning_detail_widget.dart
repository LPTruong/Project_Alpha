import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/warning.dart';

class WarningDetailWidget extends StatelessWidget {
  final Warning warning;

  const WarningDetailWidget({Key? key, required this.warning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            warning.title,
            style: GoogleFonts.inter(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: const Color(0xff353739)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.schedule,
                size: 16,
                color: const Color(0xff617882),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                warning.createAt,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.214,
                  color: const Color(0xff617882),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          const Divider(
            height: 0.3,
            color: const Color(0xffB9B9B9),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chuyên mục',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: const Color(0xff353739),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    warning.category,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                      color: const Color(0xff353739),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mức độ',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: const Color(0xff353739),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    warning.level,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                      color: const Color(0xffdd3030),
                    ),
                  )
                ],
              )

              // Text('Mức độ'),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          const Divider(
            height: 0.3,
            color: const Color(0xffB9B9B9),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Nội dung",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.4,
              color: const Color(0xff282828),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            warning.content,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: const Color(0xff272727),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            height: 0.3,
            color: const Color(0xffB9B9B9),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Đăng bởi",
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: const Color(0xff353739),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            warning.author,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.5,
              color: const Color(0xff353739),
            ),
          ),
           SizedBox(
            height: 23,
          ),
          Divider(
            height: 0.3,
            color: const Color(0xffB9B9B9),
          )
        ],
      ),
    );
  }
}
