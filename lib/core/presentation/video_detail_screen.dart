import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/models/video_model/video.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class VideoDetailScreen extends StatelessWidget {
  const VideoDetailScreen(
      {super.key,
      required this.video,
      required this.title,
      required this.isSearchNeeded});

  final Video video;
  final String title;
  final bool isSearchNeeded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Column(
          children: [
            isSearchNeeded
                ? const CustomSearchBar()
                : const SizedBox(
                    height: 20,
                  ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CustomBackButton(),
                ),
                Text(
                  "",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  HomeTile(
                    isVideo: true,
                    tilePic: video.videoImage ?? "",
                    categoryTitle: video.categoryName ?? '',
                    title: video.videoTitle ?? '',
                    subtitle: video.postedBy ?? '',
                    uri: video.videos,
                  ),
                  SizedBox(
                    width: 391,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            const TextSpan(text: "\n"),
                            TextSpan(
                              text: 'Description:',
                              style: GoogleFonts.beVietnamPro(
                                color: const Color(0xFF242A2F),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 0.11,
                              ),
                            ),
                            WidgetSpan(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '\n${video.videoDescription}\n',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.beVietnamPro(
                                    color: const Color(0xFF242A2F),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
