import 'package:flutter/cupertino.dart';

class ProfileBottomNav extends StatefulWidget {
  const ProfileBottomNav({Key? key}) : super(key: key);

  @override
  State<ProfileBottomNav> createState() => _ProfileBottomNavState();
}

class _ProfileBottomNavState extends State<ProfileBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Text("Profile")],);
  }
}
