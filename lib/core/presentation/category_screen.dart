import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
                // TextButton(
                //   style: ButtonStyle(
                //     foregroundColor:
                //         MaterialStateProperty.all<Color?>(Colors.blue),
                //     overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                //   ),
                //   child: Text(
                //     "Back",
                //     style: GoogleFonts.beVietnamPro(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //       height: 0,
                //     ),
                //   ),
                //   onPressed: () {},
                // ),
                Text(
                  "Category",
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
                  CategoryTile(
                    category: "Endocrinology",
                    categoryImage: dem1,
                  ),
                  CategoryTile(
                    category: "Thyroid Care",
                    categoryImage: dem2,
                  ),
                  CategoryTile(
                    category: "Diabetes Care",
                    categoryImage: dem3,
                  ),
                  CategoryTile(
                    category: "PCOD",
                    categoryImage: dem4,
                  ),
                  CategoryTile(
                    category: "Gynecology",
                    categoryImage: dem5,
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
