import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
