import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';

PreferredSizeWidget customAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(65.0),
    child: AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.99, -0.15),
            end: Alignment(-0.99, 0.15),
            colors: [
              Color.fromARGB(255, 28, 65, 146),
              Color(0xff00aeef),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: SvgPicture.asset(snackBar),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 1.0,
              left: 8,
            ),
            child: FittedBox(
              fit: BoxFit
                  .scaleDown, // Scale down the text to fit within available space
              child: Text(
                "JEEVANS DIABETES & ENDOCRINOLOGY",
                //textAlign: TextAlign.center,
                style: GoogleFonts.koulen(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
