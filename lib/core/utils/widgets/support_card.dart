import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportCard extends StatelessWidget {
  final String phone;
  final String mobile;
  final String googleMap;
  const SupportCard(
      {super.key,
      required this.phone,
      required this.mobile,
      required this.googleMap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 391,
      height: 187,
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
      child: Stack(
        children: [
          Positioned(
            top: 28,
            left: 18,
            child: Text(
              "Service Support",
              style: GoogleFonts.beVietnamPro(
                color: const Color(0xFF3C3C3D),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                height: 0.08,
              ),
            ),
          ),
          Positioned(
            top: 67,
            left: 64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Telephone',
                  style: GoogleFonts.beVietnamPro(
                    color: const Color(0xFFA0A0A0),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 0.14,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  phone,
                  style: GoogleFonts.beVietnamPro(
                    color: const Color(0xFF4A4A4A),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            left: 29,
            child: SvgPicture.asset(telephoneIcon),
          ),
          Positioned(
            bottom: 39,
            left: 29,
            child: SvgPicture.asset(mobileIcon),
          ),
          Positioned(
            bottom: 40,
            left: 64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mobile',
                  style: GoogleFonts.beVietnamPro(
                    color: const Color(0xFFA0A0A0),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 0.14,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  mobile,
                  style: GoogleFonts.beVietnamPro(
                    color: const Color(0xFF4A4A4A),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            top: 22,
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse(googleMap));
              },
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.3, // Adjust the width as needed
                height: MediaQuery.of(context).size.width *
                    0.3 *
                    (138 / 130), // Calculate height to maintain aspect ratio
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.19),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      mapPic,
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                    Center(
                      child: Text(
                        'LOCATE US',
                        style: GoogleFonts.beVietnamPro(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
