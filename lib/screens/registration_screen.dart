import 'package:card_based_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../custome/colorLibrary.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_field.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _myUsername = TextEditingController();
  final TextEditingController _myEmailAddress = TextEditingController();
  final TextEditingController _myPassword = TextEditingController();
  final TextEditingController _myConfirmPassword = TextEditingController();

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
                    myController: _myUsername,
                    hintText: "Username",
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
                  CustomizedField(
                    myController: _myConfirmPassword,
                    hintText: "Confirm Password",
                    isPassword: true,
                  ),

                  CustomizedButton(
                    buttonColor: Colors.black,
                    buttonText: "Register",
                    textColor: Colors.white,
                    onPress: (){},
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
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
