import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
      onTap: onTap,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: 145,
          height: 50,
          decoration: ShapeDecoration(
            color: const Color(0xFF03A1E7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(31.50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
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
      ),
    );
  }
}
