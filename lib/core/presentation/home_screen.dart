import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/presentation/video_detail_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch popular videos when the screen is initialized
    context.read<ApiBloc>().add(PopularVideosFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(ApiState state) {
    if (state is ApiLoadingState) {
      // Loading state
      return const Center(child: CircularProgressIndicator());
    } else if (state is ApiSuccessState) {
      // Success state
      final videos = state.video;

      return RefreshIndicator(
        onRefresh: () async {
          // Trigger a refresh by fetching popular videos again
          context.read<ApiBloc>().add(PopularVideosFetchEvent());
        },
        child: Padding(
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
                child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];

                    return HomeTile(
                      isVideo: false,
                      tilePic: video.videoImage ?? "",
                      categoryTitle: video.categoryName ?? '',
                      title: video.videoTitle ?? '',
                      subtitle: video.postedBy ?? '',
                      uri: video.videos,
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
                ),
              )
            ],
          ),
        ),
      );
    } else {
      // Error state
      context.read<ApiBloc>().add(PopularVideosFetchEvent());
      return const SizedBox();
    }
  }
}
