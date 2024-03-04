import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final String categoryImage;
  const CategoryTile({
    super.key,
    required this.category,
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    print("category Image: $categoryImage");
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: SizedBox(
              width: 390,
              height: 170,
              child: Image.network(
                categoryImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 17,
            left: 25,
            child: Container(
              width: 105,
              height: 23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.5),
                color: const Color(0xFF00AEEF),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 8.0, 0, 8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      whiteTick,
                    ),
                    const SizedBox(width: 1),
                    Expanded(
                      child: Text(
                        category,
                        style: GoogleFonts.beVietnamPro(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          height: 0.27,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
