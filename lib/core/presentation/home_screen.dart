import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/presentation/video_detail_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ApiBloc>().add(PopularVideosFetchEvent());
    return Scaffold(
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
                Text(
                  "Home",
                  style: GoogleFonts.beVietnamPro(
                    color: const Color(0xFFA6A6A6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  "Popular Videos",
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
              child: BlocBuilder<ApiBloc, ApiState>(
                builder: (context, state) {
                  if (state is ApiLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ApiSuccessState) {
                    // Assuming you have a list of Video objects in state
                    final videos = state.video;
                    return ListView.builder(
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        final video = videos[index];
                        return HomeTile(
                          tilePic: video.videoImage ?? "",
                          categoryTitle: video.categoryName ?? '',
                          title: video.videoTitle ?? '',
                          subtitle: video.postedBy ?? '',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => VideoDetailScreen(
                                  isSearchNeeded: false,
                                  video: video,
                                  title: 'Popular Videos',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    // Handle error state
                    return const Center(
                      child: Text('Failed to fetch videos'),
                    );
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
