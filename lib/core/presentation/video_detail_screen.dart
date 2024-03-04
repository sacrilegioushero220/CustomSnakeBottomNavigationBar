import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/models/video_model/video.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class VideoDetailScreen extends StatelessWidget {
  final Video video;
  final String title;
  const VideoDetailScreen(
      {super.key, required this.video, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            const CustomSearchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color?>(Colors.blue),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: Text(
                    "Back",
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
            Expanded(
              child: ListView(
                children: [
                  HomeTile(
                    tilePic: video.videoImage ?? "",
                    categoryTitle: video.categoryName ?? '',
                    title: video.videoTitle ?? '',
                    subtitle: video.postedBy ?? '',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 391,
                    height: 200,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Description:\n',
                            style: GoogleFonts.beVietnamPro(
                              color: const Color(0xFF242A2F),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 0.11,
                            ),
                          ),
                          TextSpan(
                            text: '\n${video.videoDescription}',
                            style: GoogleFonts.beVietnamPro(
                              color: const Color(0xFF242A2F),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
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
