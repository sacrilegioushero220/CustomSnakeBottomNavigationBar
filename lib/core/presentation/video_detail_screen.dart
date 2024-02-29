import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class VideoDetailScreen extends StatelessWidget {
  const VideoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            const CustomSearchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color?>(Colors.blue),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: Text(
                    "Back",
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Popular Videos",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  HomeTile(
                    tilePic: pic1,
                    categoryTitle: "Endocrinology",
                    title: "What is endocrinology?",
                    subtitle: "Dr. Jeevan Joseph, MBBS, MD (Gen Med)",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 391,
                    height: 200,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Description:\n',
                            style: GoogleFonts.beVietnamPro(
                              color: const Color(0xFF242A2F),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 0.11,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nEndocrinology is the study of the endocrine system in the human body. This is a system of glands which secrete hormones. Hormones are chemicals that affect the actions of different organ systems in the body. Examples include thyroid hormone, growth hormone, and insulin.',
                            style: GoogleFonts.beVietnamPro(
                              color: const Color(0xFF242A2F),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
