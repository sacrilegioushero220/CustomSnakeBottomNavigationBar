import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final String categoryImage;
  final void Function()? onTap;
  const CategoryTile({
    super.key,
    required this.category,
    required this.categoryImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Stack(
          children: [
            InkWell(
              onTap: onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(21),
                child: SizedBox(
                  width: 390,
                  height: 170,
                  child: Image.network(
                    categoryImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 17,
              left: 25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF00AEEF),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(11, 8.0, 0, 8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        whiteTick,
                      ),
                      const SizedBox(width: 5),
                      FittedBox(
                        // fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            category,
                            style: GoogleFonts.beVietnamPro(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
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
      ),
    );
  }
}
