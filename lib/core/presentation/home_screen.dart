import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/presentation/video_detail_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: GoogleFonts.beVietnamPro(
                    color: const Color(0xFFA6A6A6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  HomeTile(
                    tilePic: pic1,
                    categoryTitle: "Endocrinology",
                    title: "What is endocrinology?",
                    subtitle: "Dr. Jeevan Joseph, MBBS, MD (Gen Med)",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const VideoDetailScreen()));
                    },
                  ),
                  HomeTile(
                    tilePic: pic2,
                    categoryTitle: "Thyroid Care",
                    title: "Natural Remedies for Hypothyroidism",
                    subtitle: "Dr. Jeevan Joseph, MBBS, MD (Gen Med)",
                  ),
                  HomeTile(
                    tilePic: pic3,
                    categoryTitle: "Diabetes Care",
                    title: "പ്രമേഹം തടയാം, 5 മാർഗ്ഗങ്ങൾ ",
                    subtitle: "Dr. Jeevan Joseph, MBBS, MD (Gen Med)",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
