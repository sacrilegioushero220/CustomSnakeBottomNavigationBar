import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/Bloc/api_bloc/api_bloc.dart';
import 'package:jeevan_diabetes_app/core/presentation/search_results_screen.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';
import 'package:jeevan_diabetes_app/network/api_service.dart';

class CustomSearchBar extends StatefulWidget {
  final String? searchedKeyword;
  final Function(String) onSearch;

  const CustomSearchBar({
    super.key,
    this.searchedKeyword,
    required this.onSearch,
  });

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.searchedKeyword);
  }

  @override
  void didUpdateWidget(covariant CustomSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchedKeyword != oldWidget.searchedKeyword) {
      _textEditingController.text = widget.searchedKeyword ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _textEditingController,
                onSubmitted: (query) {
                  widget.onSearch(query);
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
                widget.onSearch(_textEditingController.text.trim());
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
