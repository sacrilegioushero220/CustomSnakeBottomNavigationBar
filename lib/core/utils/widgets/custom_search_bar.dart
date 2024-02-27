import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Container(
        height: 50,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 5,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(searchLens),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search a video here...',
                  hintStyle: GoogleFonts.beVietnamPro(
                    color: const Color(0xFFC1C2C6),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    left: 16,
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
