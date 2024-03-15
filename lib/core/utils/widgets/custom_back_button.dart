import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.textEditingController,
  });
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(
        "Back",
        style: GoogleFonts.beVietnamPro(
          color: Colors.blue,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }
}
