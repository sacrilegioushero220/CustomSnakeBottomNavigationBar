import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:jeevan_diabetes_app/core/presentation/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';
import 'package:jeevan_diabetes_app/core/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const AboutScreen(),
    const ContactScreen(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(17),
          child: SvgPicture.asset(snackBar),
        ),
        title: Text(
          "JEEVANS DIABETES & ENDORINOLOGY",
          textAlign: TextAlign.center,
          style: GoogleFonts.koulen(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SnakeNavigationBar.color(
          padding: const EdgeInsets.all(12),
          backgroundColor: const Color(0xff242a2f),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          behaviour: SnakeBarBehaviour.floating,
          showSelectedLabels: true,
          snakeViewColor: const Color(0xff03a1e7),
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(homeIcon),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(categoryIcon),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(aboutIcon),
              label: "About",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(contactIcon),
              label: "Contact",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
