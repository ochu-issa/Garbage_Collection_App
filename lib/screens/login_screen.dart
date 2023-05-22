
import 'package:card_based_app/controllers/authentication.dart';
import 'package:card_based_app/custome/colorLibrary.dart';
import 'package:card_based_app/screens/home_screen.dart';
import 'package:card_based_app/screens/registration_screen.dart';
import 'package:card_based_app/screens/welcome_screen.dart';
import 'package:card_based_app/widgets/customized_button.dart';
import 'package:card_based_app/widgets/customized_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final AuthenticationController _authenticationController =
  //     Get.put(AuthenticationController());
  final AuthenticationController _authenticationController = AuthenticationController();


  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // close keyboard when a tap is detected
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Welcome back! Glad\nto see you again",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomizedField(
                    myController: _emailController,
                    hintText: "Enter your Email",
                    isPassword: false,
                  ),
                  CustomizedField(
                    myController: _passwordController,
                    hintText: "Enter your Password",
                    isPassword: true,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 15,
                          color: MyCustomeColors.darkGrey,
                        ),
                      ),
                    ),
                  ),
                  // CustomizedButton(
                  //   textColor: Colors.white,
                  //   buttonText: "Login",
                  //   buttonColor: Colors.black,
                  //   onPress: () async {
                  //     await _authenticationController.login(
                  //       email: _emailController.text!.trim(),
                  //       password: _passwordController.text!.trim(),
                  //     );
                  //   },
                  //   authenticationController: _authenticationController,
                  // ),
                  CustomizedButton(
                    textColor: Colors.white,
                    buttonText: "Login",
                    buttonColor: Colors.black,
                    onPress: () async{
                      await _authenticationController.logIn(
                          email: _emailController.text!.trim(),
                          password: _passwordController.text.trim());
                    },
                    authenticationController: _authenticationController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 15,
                            color: MyCustomeColors.darkGrey,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => RegistrationScreen());
                          },
                          child: const Text(
                            "Register new!",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
