import 'package:flutter/material.dart';
import 'package:project_alpha/features/presentation/pages/warning_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain/entities/warning.dart';

class WarningListWidget extends StatelessWidget {
  final List<Warning> warnings;
  const WarningListWidget({Key? key, required this.warnings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: warnings.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WarningDetailPage(warning: warnings[index]),
                ),
              );
            },
            child: FormWarningListItem(
              avatarURL: warnings[index].image,
              title: warnings[index].title,
              category: warnings[index].category,
              createAt: warnings[index].createAt,
            ));

        // ListTile(
        //   leading: Text(warnings[index].id.toString()),
        //   title: Text(
        //     warnings[index].title,
        //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //   ),
        //   subtitle: Text(
        //     warnings[index].content,
        //     style: TextStyle(fontSize: 16),
        //   ),
        //   contentPadding: EdgeInsets.symmetric(horizontal: 15),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (_) => WarningDetailPage(warning: warnings[index]),
        //       ),
        //     );
        //   },
        // );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
    );
  }
}

class FormWarningListItem extends StatelessWidget {
  final String avatarURL;
  final String title;
  final String category;
  // final Function onTap;
  final String createAt;

  FormWarningListItem({
    required this.avatarURL,
    required this.title,
    required this.category,
    // required this.onTap,
    required this.createAt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 137,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 96,
                height: 96,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.red,
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(avatarURL),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category.toUpperCase(),
                      style: GoogleFonts.inter(
                        
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      // width: 200,
                      height: 50,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff353739),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      createAt,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff617882),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
