import 'package:card_based_app/screens/home_screen.dart';
import 'package:card_based_app/screens/link_card.dart';
import 'package:card_based_app/screens/login_screen.dart';
import 'package:card_based_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../custome/colorLibrary.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 1;
  static List<Widget> screen = <Widget>[
    const HomeScreen(),
    RegistrationScreen(),
    const LinkCardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.white,
          activeColor: Colors.black,
          color: Colors.black,
          tabBackgroundColor: MyCustomeColors.fieldColor,
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.app_registration_outlined,
              text: "Request",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
              print(_selectedIndex);
            });
          },
        ),
      ),
    );
  }
}


