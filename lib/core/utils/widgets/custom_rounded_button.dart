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
          width: 120,
          height: 40,
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
              children: [
                FittedBox(
                  fit:BoxFit.scaleDown,
                  child: Text(
                    "Watch Now",
                    style: GoogleFonts.beVietnamPro(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                const Icon(
                  Icons.play_arrow,
                  size: 25,
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
