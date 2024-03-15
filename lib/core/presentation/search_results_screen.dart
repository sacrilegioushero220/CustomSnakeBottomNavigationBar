import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/models/models.dart';
import 'package:jeevan_diabetes_app/core/presentation/video_detail_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';
import 'package:jeevan_diabetes_app/network/api_service.dart';

class ResultsPage extends StatefulWidget {
  final String title;
  final Future<List<Video>>? future;
  final bool isSearchNeeded;
  final String? searchedKeyword;

  const ResultsPage({
    super.key,
    required this.title,
    required this.future,
    required this.isSearchNeeded,
    this.searchedKeyword,
  });

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String? query;

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
            widget.isSearchNeeded
                ? CustomSearchBar(
                    searchedKeyword: widget.searchedKeyword,
                    onSearch: (query) {
                      setState(() {
                        this.query = query;
                      });
                    },
                  )
                : const SizedBox(
                    height: 20,
                  ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  Expanded(
                    child: SizedBox(
                      width: 284,
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.beVietnamPro(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<Video>>(
                future: query != null
                    ? ApiService().searchVideos(query!)
                    : widget.future,
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
                                  title: widget.title,
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
