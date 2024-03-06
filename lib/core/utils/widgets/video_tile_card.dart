import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class VideoTileCard extends StatelessWidget {
  const VideoTileCard({
    super.key,
    required this.tilePic,
    required this.categoryTitle,
    required this.onTap,
  });

  final String tilePic;
  final String categoryTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: SizedBox(
                width: 391,
                height: 337,
                child: Image.network(
                  tilePic,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                ),
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
      ),
    );
  }
}
