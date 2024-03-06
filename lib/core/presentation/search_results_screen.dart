import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/models/models.dart';
import 'package:jeevan_diabetes_app/core/presentation/video_detail_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class ResultsPage extends StatelessWidget {
  final String title;
  final Future<List<Video>>? future;
  final bool isSearchNeeded;

  const ResultsPage(
      {super.key,
      required this.title,
      required this.future,
      required this.isSearchNeeded});

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
            isSearchNeeded
                ? const CustomSearchBar()
                : const SizedBox(
                    height: 5,
                  ),
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
                  title,
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
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<Video>>(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final videos = snapshot.data!;

                    if (videos.isEmpty) {
                      return const Center(child: Text('No results found.'));
                    }
                    return ListView.builder(
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        final video = videos[index];

                        return HomeTile(
                          isVideo: false,
                          tilePic: video.videoImage ?? "",
                          categoryTitle: video.categoryName ?? "",
                          title: video.videoTitle ?? '',
                          subtitle: video.postedBy ?? '',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => VideoDetailScreen(
                                  isSearchNeeded: false,
                                  video: video,
                                  title: title,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No results found.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
