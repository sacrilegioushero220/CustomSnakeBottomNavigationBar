import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Contact",
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
            Text(
              "You can get in touch with us through below platforms. Our Team will reach out to you as soon as it would be posible.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.beVietnamPro(
                color: const Color(0xFFA4A4A4),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  const SupportCard(),
                  const SizedBox(height: 12),
                  const SocialMediaCard(),
                  const SizedBox(height: 12),
                  Text(
                    'Vimala Hospital Complex, M.C. Road, Ettumanoor\nKottayam 686631, Kerala - India',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.beVietnamPro(
                      color: const Color(0xFF242A2F),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.11,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
