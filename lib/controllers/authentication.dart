import 'dart:convert';

import 'package:card_based_app/screens/home_screen.dart';
import 'package:card_based_app/screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/constant.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;
  final box = GetStorage();


  // Registration Function
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      final data = {
        'f_name': firstName,
        'l_name': lastName,
        'email': email,
        'password': password,
      };


        if (kDebugMode) {
          print(AppConstants.baseURL + AppConstants.REGISTER_ENDPOINT);
          print(json.encode(data));
        }
      final response = await http.post(
        Uri.parse(AppConstants.baseURL + AppConstants.REGISTER_ENDPOINT),
        headers: {
          'Content-Type': 'application/vnd.api+json',
          'Accept': 'application/vnd.api+json',
          'origin': '*'// Set the content type to JSON
        },
        body: json.encode(data), // Convert the data map to a JSON string
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        debugPrint(response.body);
        Get.offAll(() => const HomeScreen());
      } else {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        //print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

// Login Function
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      final data = {
        'email': email,
        'password': password,
      };
      final response = await http.post(
        Uri.parse(AppConstants.baseURL + AppConstants.LOGIN_ENDPOINT),
        headers: {
          'Content-Type': 'application/vnd.api+json',
          'Accept': 'application/vnd.api+json', // Set the content type to JSON
        },
        body: json.encode(data), // Convert the data map to a JSON string
      );

      if (response.statusCode == 200) {
        //succes
        isLoading(false);
        token.value = json
            .decode(response.body)['data']['token']
            .toString(); //take the token values
        box.write('token', token.value); //put on box
        Get.offAll(() => const HomeScreen());
      } else {
        //invalid crediantial
        isLoading(false);
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logout() async {
print(GetStorage().read('token'));
    try {
      final response = await http.post(
        Uri.parse(AppConstants.baseURL + AppConstants.LOGOUT_ENDPOINT),
        headers: {
          'Content-Type': 'application/vnd.api+json',
          'Accept': 'application/vnd.api+json', // Set the content type to JSON
          'Authorization': 'Bearer ' + GetStorage().read('token'),
        },
      );
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 200){

        print('logout successfully!');
      }else if(response.statusCode == 401){

        print('unauthorized');

      }else{

        //Get.to(() => WelcomeScreen());
        print('Error happened');
      }

      GetStorage().remove('token');
      Get.offAll(() => WelcomeScreen());
    } catch (e) {
      print('Logout error: $e');
    }
  }
}
