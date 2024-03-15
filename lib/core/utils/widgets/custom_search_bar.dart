import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/presentation/search_results_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';
import 'package:jeevan_diabetes_app/network/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSearchBar extends StatelessWidget {
  final String? searchedKeyword;
  const CustomSearchBar({super.key, this.searchedKeyword});

  @override
  Widget build(BuildContext context) {
    String? query;
    final TextEditingController textEditingController =
        TextEditingController(text: searchedKeyword);
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Container(
        height: 50,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 5,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                onSubmitted: (query) {
                  query = query;
                  _searchSubmit(context, query);
                },
                decoration: InputDecoration(
                  hintText: 'Search a video here...',
                  hintStyle: GoogleFonts.beVietnamPro(
                    color: const Color(0xFFC1C2C6),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                  ),
                ),
                cursorColor: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                query = textEditingController.text.trim();
                _searchSubmit(context, query ?? "");
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(searchLens),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_searchSubmit(BuildContext context, String query) {
  // Dispatch a search event to the API Bloc
  context.read<ApiBloc>().add(SearchVideosEvent(query));

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ResultsPage(
        isSearchNeeded: true,
        title: "Search Results",
        searchedKeyword: query, // Pass the searched keyword to the ResultsPage
        future: ApiService().searchVideos(query),
      ),
    ),
  );
}
