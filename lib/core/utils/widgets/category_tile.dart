import 'package:flutter/material.dart';
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.03, 1.00),
                end: const Alignment(0.03, -1),
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.2)
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            child: ClipRect(
              child: Image.network(
                categoryImage,
                fit: BoxFit.contain,
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
