import 'package:card_based_app/screens/%20confirm_request.dart';
import 'package:card_based_app/screens/home_screen.dart';
import 'package:card_based_app/screens/registration_screen.dart';
import 'package:card_based_app/screens/request_screen.dart';
import 'package:card_based_app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// void main() {
//   final box = GetStorage();
//   var token = box.read('token');
//   runApp( GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: token == null ? WelcomeScreen() : const HomeScreen(),
//   ));
// }

// void main(){
//   runApp( MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:  CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return const SnackBar(
                content: Text("Something went wrong"),
            );
          }
          else if (snapshot.hasData) {
            // User is logged in
            return const HomeScreen();
          } else {
            // User is not logged in
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     var token = box.read('token');
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: token == null ?  WelcomeScreen() : const HomeScreen(),
//     );
//   }
// }

