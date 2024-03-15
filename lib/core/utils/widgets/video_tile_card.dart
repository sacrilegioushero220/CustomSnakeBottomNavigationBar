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
                child: AspectRatio(
                  aspectRatio: 5 / 3,
                  child: Image.network(
                    width: 500,
                    height: 300,
                    tilePic,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        homePlaceHolder,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 17,
            left: 30,
            child: Container(
              height: 23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.5),
                color: const Color(0xFF00AEEF),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 8.0, 11, 8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      whiteTick,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      categoryTitle,
                      style: GoogleFonts.beVietnamPro(
                        color: Colors.white,
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
