
import 'package:card_based_app/screens/home_screen.dart';
import 'package:card_based_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

// void main() {
//   final box = GetStorage();
//   var token = box.read('token');
//   runApp( GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: token == null ? WelcomeScreen() : const HomeScreen(),
//   ));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var token = box.read('token');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: token == null ?  WelcomeScreen() : const HomeScreen(),
    );
  }
}

