import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/custom_video_player.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/video_tile_card.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.tilePic,
    required this.categoryTitle,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.uri,
    required this.isVideo,
  });
  final String? tilePic;
  final String? categoryTitle;
  final String? title;
  final String subtitle;
  final bool isVideo;
  final void Function()? onTap;
  final String? uri;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isVideo
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.black,
                    child: CustomVideoPlayer(
                      uri: uri ?? "",
                    ),
                  ),
                )
              : VideoTileCard(
                  tilePic: tilePic ?? "",
                  categoryTitle: categoryTitle ?? "",
                  onTap: onTap,
                ),
          const SizedBox(
            height: 10,
            width: 320,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: isVideo ? 10 : 0,
              right: isVideo ? 10 : 0,
            ),
            child: Text(
              title ?? "No title found",
              overflow: isVideo ? TextOverflow.visible : TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              maxLines: isVideo ? 8 : 2,
              style: GoogleFonts.beVietnamPro(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                wordSpacing: 1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: isVideo ? 10 : 0,
              right: isVideo ? 10 : 0,
            ),
            child: Text(
              subtitle,
              style: GoogleFonts.beVietnamPro(
                color: const Color(0xFFA6A6A6),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0.15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
