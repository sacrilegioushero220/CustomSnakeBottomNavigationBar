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
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isVideo
              ? Container(
                  height: 200,
                  color: Colors.white,
                  child: CustomVideoPlayer(
                    uri: uri ?? "",
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
          Text(
            title ?? "No title found",
            maxLines: 2,
            style: GoogleFonts.beVietnamPro(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
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
