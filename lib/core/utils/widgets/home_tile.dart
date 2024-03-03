import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.tilePic,
    required this.categoryTitle,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final String tilePic;
  final String categoryTitle;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoTileCard(
            tilePic: tilePic,
            categoryTitle: categoryTitle,
            onTap: onTap,
          ),
          const SizedBox(
            height: 40,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: GoogleFonts.beVietnamPro(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 0.05,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            subtitle,
            style: GoogleFonts.beVietnamPro(
              color: const Color(0xFFA6A6A6),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 0.15,
            ),
          )
        ],
      ),
    );
  }
}
