import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/utils/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomSearchBar(),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: GoogleFonts.beVietnamPro(
                    color: const Color(0xFFA6A6A6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  "Popular Videos",
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
                ListTile(
                  title: Text("title"),
                  subtitle: Text("subtitle"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
