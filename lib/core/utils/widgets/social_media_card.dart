import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard(
      {super.key,
      required this.instagramLink,
      required this.facebookLink,
      required this.youTubeLink});
  final String instagramLink;
  final String facebookLink;
  final String youTubeLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 225,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Social Media",
              style: GoogleFonts.beVietnamPro(
                color: const Color(0xFF3C3C3D),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            socialMediaCard(
              socialMediaName: "Instagram",
              username: instagramLink,
              logo: instaIconWhite,
            ),
            socialMediaCard(
              socialMediaName: "Facebook",
              username: facebookLink,
              logo: facebookIcon,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: socialMediaCard(
                socialMediaName: "Youtube",
                username: youTubeLink,
                logo: youtubeIconWhite2,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row socialMediaCard({
    required String socialMediaName,
    required String username,
    required String logo,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(logo),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              socialMediaName,
              style: GoogleFonts.beVietnamPro(
                color: const Color(0xFFA0A0A0),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              username,
              style: GoogleFonts.beVietnamPro(
                color: const Color(0xFF4A4A4A),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
