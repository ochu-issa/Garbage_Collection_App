import 'dart:convert';

import 'package:card_based_app/screens/home_screen.dart';
import 'package:card_based_app/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/constant.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();

  //Registration Function
  // Future<void> register({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     isLoading.value = true;
  //
  //     final data = {
  //       'f_name': firstName,
  //       'l_name': lastName,
  //       'email': email,
  //       'password': password,
  //     };
  //
  //     final response = await http.post(
  //       Uri.parse(AppConstants.url + 'registerUser'),
  //       headers: {
  //         'Content-Type': 'application/json', // Set the content type to JSON
  //       },
  //       body: json.encode(data), // Convert the data map to a JSON string
  //     );
  //
  //     if (response.statusCode == 201) {
  //       isLoading.value = false;
  //       debugPrint(response.body);
  //       Get.offAll(() => const HomeScreen());
  //     } else {
  //       isLoading.value = false;
  //       Get.snackbar(
  //         'Error',
  //         json.decode(response.body)['message'],
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //       print(json.decode(response.body));
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     print(e.toString());
  //   }
  // }

  //login with Firebase
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Email field is required!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        'Password field is required!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(() => const HomeScreen());
    } on FirebaseException catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar(
        'Error',
        e.message ?? 'An error occurred',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      // Create the user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      Get.to(() => const HomeScreen());
      // Get the currently logged in user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Store the additional user data in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'firstname': firstName,
          'lastname': lastName,
          'email': email,
        });

        // // Update the user profile display name (optional)
        // await user.updateDisplayName('$firstName $lastName');
      }
    } on FirebaseException catch (e) {
      isLoading.value = false;
      print(e);
      Get.snackbar(
        'Error',
        e.message ?? 'An error occurred',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

//Login Function
  // Future<void> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     isLoading.value = true;
  //
  //     final data = {
  //       'email': email,
  //       'password': password,
  //     };
  //
  //     final response = await http.post(
  //       Uri.parse(AppConstants.url + 'loginUser'),
  //       headers: {
  //         'Content-Type': 'application/json', // Set the content type to JSON
  //       },
  //       body: json.encode(data), // Convert the data map to a JSON string
  //     );
  //
  //     if (response.statusCode == 200) {
  //       //succes
  //       isLoading(false);
  //       token.value = json.decode(response.body)['token']; //take the token values
  //       box.write('token', token.value); //put on box
  //       Get.offAll(() => const HomeScreen());
  //     } else if (response.statusCode == 202) {
  //       //invalid crediantial
  //       isLoading(false);
  //       Get.snackbar(
  //         'Error',
  //         json.decode(response.body)['message'],
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     } else if (response.statusCode == 203) {
  //       isLoading(false); //field required or exist
  //       Get.snackbar(
  //         'Error',
  //         json.decode(response.body)['message'],
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //       print(json.decode(response.body));
  //     }
  //   } catch (e) {
  //     isLoading(false);
  //     print(e.toString());
  //   }
  // }
}
