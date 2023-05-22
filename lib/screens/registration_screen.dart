import 'package:card_based_app/controllers/authentication.dart';
import 'package:card_based_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custome/colorLibrary.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_field.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _myEmailAddress = TextEditingController();
  final TextEditingController _myPassword = TextEditingController();
  final TextEditingController _myConfirmPassword = TextEditingController();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  RegistrationScreen({Key? key}) : super(key: key);

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
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
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
                      "Hello! Register to get\nstarted",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomizedField(
                    myController: _firstName,
                    hintText: "First Name",
                    isPassword: false,
                  ),
                  CustomizedField(
                    myController: _lastName,
                    hintText: "Last Name",
                    isPassword: false,
                  ),
                  CustomizedField(
                    myController: _myEmailAddress,
                    hintText: "Enter your Email",
                    isPassword: false,
                  ),
                  CustomizedField(
                    myController: _myPassword,
                    hintText: "Password",
                    isPassword: true,
                  ),
                  // CustomizedField(
                  //   myController: _myConfirmPassword,
                  //   hintText: "Confirm Password",
                  //   isPassword: true,
                  // ),
                  CustomizedButton(
                            buttonColor: Colors.black,
                            buttonText: "Register",
                            textColor: Colors.white,
                            onPress: () async {
                              await _authenticationController.register(
                                  firstName: _firstName.text.trim(),
                                  lastName: _lastName.text.trim(),
                                  email: _myEmailAddress.text.trim(),
                                  password: _myPassword.text.trim(),
                              );
                            }, authenticationController: _authenticationController,
                          ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
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
                              Get.to(() => LoginScreen());
                          },
                          child: const Text(
                            "Login now!",
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
