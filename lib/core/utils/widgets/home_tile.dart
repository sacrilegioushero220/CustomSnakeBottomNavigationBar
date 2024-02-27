import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 337,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.03, 1.00),
                      end: const Alignment(-0.03, -1),
                      colors: [Colors.black, Colors.black.withOpacity(0)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  child: Image.asset(
                    pic1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 17,
                left: 30,
                child: Container(
                  width: 105,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.5),
                    color: const Color(0x93ffffff),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 8.0, 12, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          blueTick,
                        ),
                        Text(
                          "Endocrinology",
                          style: GoogleFonts.beVietnamPro(
                            color: const Color(0xFF8F89A6),
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            height: 0.27,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 23,
                left: 30,
                child: SvgPicture.asset(youTubeIcon),
              ),
              Positioned(
                right: 30,
                bottom: 19,
                child: Container(
                  width: 157,
                  height: 63,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF03A1E7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31.50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Watch Now",
                          style: GoogleFonts.beVietnamPro(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        const Icon(
                          Icons.play_arrow,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "What is endocrinology?",
            style: GoogleFonts.beVietnamPro(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 0.05,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Dr. Jeevan Joseph, MBBS, MD (Gen Med)',
            style: GoogleFonts.beVietnamPro(
              color: const Color(0xFFA6A6A6),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 0.15,
            ),
          )
        ],
      ),
    );
  }
}
