import 'package:card_based_app/screens/home_screen.dart';
import 'package:card_based_app/screens/login_screen.dart';
import 'package:card_based_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../custome/colorLibrary.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;
  final List<Widget> screens = [    HomeScreen(),    RegistrationScreen(),    LoginScreen(),  ];
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
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
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
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
