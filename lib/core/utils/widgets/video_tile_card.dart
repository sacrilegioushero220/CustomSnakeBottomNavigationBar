import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class VideoTileCard extends StatelessWidget {
  const VideoTileCard({
    super.key,
    required this.tilePic,
    required this.categoryTitle,
    this.onTap,
  });

  final String tilePic;
  final String categoryTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 337,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.03, 1.00),
                end: const Alignment(-0.03, -1),
                colors: [Colors.black, Colors.black.withOpacity(0)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
            ),
            child: Image.asset(
              tilePic,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 17,
          left: 30,
          child: Container(
            width: 105,
            height: 23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.5),
              color: const Color(0x93ffffff),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 8.0, 0, 8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    blueTick,
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Text(
                    categoryTitle,
                    style: GoogleFonts.beVietnamPro(
                      color: const Color(0xFF8F89A6),
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      height: 0.27,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 23,
          left: 30,
          child: SvgPicture.asset(youTubeIcon),
        ),
        Positioned(
          right: 30,
          bottom: 19,
          child: CustomRoundedButton(
            onTap: onTap,
          ),
        )
      ],
    );
  }
}
