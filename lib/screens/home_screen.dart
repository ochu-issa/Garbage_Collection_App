import 'package:card_based_app/custome/colorLibrary.dart';
import 'package:card_based_app/screens/bottom_nav_pages/home.dart';
import 'package:card_based_app/screens/bottom_nav_pages/profile.dart';
import 'package:card_based_app/screens/bottom_nav_pages/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../controllers/authentication.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
 final AuthenticationController _authenticationController = Get.put(AuthenticationController());
 int _selectedIndex = 0;
 static List<Widget> screen = <Widget>[
   HomeBottomNav(),
   RequestBottomNav(),
   ProfileBottomNav(),
 ];
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var token = box.read('token');
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: const BottomNavigationWidget(),
        backgroundColor: MyCustomeColors.backgroundColor,
        body:screen[_selectedIndex],
        bottomNavigationBar: Container(
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
              tabBackgroundColor: MyCustomeColors.backgroundColor,
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
        ),
      ),
    );
  }
}
