import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevan_diabetes_app/core/presentation/screens.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (_selectedIndex > 0) {
          setState(() {
            _selectedIndex = 0;
          });
        } else if (_selectedIndex == 0) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                'Do you want to exit the app?',
                style: GoogleFonts.beVietnamPro(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.beVietnamPro(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    canPop = true;
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    'Exit',
                    style: GoogleFonts.beVietnamPro(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        appBar: customAppBar(),
        body: screens[_selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SnakeNavigationBar.color(
            height: 50,
            padding: const EdgeInsets.all(12),
            backgroundColor: const Color(0xff242a2f),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            behaviour: SnakeBarBehaviour.floating,
            snakeViewColor: const Color(0xff03a1e7),
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? SvgPicture.asset(
                        home,
                        height: 13,
                      )
                    : SvgPicture.asset(homeIcon),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? SvgPicture.asset(
                        category,
                        height: 15,
                      )
                    : SvgPicture.asset(
                        categoryIcon,
                      ),
                label: "Category",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? SvgPicture.asset(
                        about,
                        height: 14,
                      )
                    : SvgPicture.asset(aboutIcon),
                label: "About",
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? SvgPicture.asset(
                        contact,
                        height: 13,
                      )
                    : SvgPicture.asset(contactIcon),
                label: "Contact",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            snakeShape: SnakeShape.custom,
          ),
        ),
      ),
    );
  }
}
