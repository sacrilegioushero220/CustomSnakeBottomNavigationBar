import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            const CustomSearchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "About",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  AboutTile(
                    title:
                        "Jeevans Diabetes and Endocrinology Speciality Clinic",
                    subtitle: "By Dr. Jeevan Joseph",
                    content:
                        "Jeevans Diabetes and Endocrine centre is a center of excellence in diabetes and hormonal care, started by Dr. Jeevan Joseph who is an Endocrinologist trained in the United Kingdom and has returned to Kottayam with a vision to bring international expertise and experience home.",
                    image: hospitalPic,
                  ),
                  AboutTile(
                      title:
                          "Inaguration of Jeevans Diabetes and Endocrine Centre",
                      subtitle: "",
                      image: inaugurationPic,
                      content:
                          "by Shri Suresh Kurup, Hon Ettumanoor MLA and Ms.Sikha Surendran IAS, Assistant Collector, Kottayam")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
