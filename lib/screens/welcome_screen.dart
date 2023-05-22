import 'package:card_based_app/screens/login_screen.dart';
import 'package:card_based_app/screens/registration_screen.dart';
import 'package:card_based_app/widgets/customized_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication.dart';

class WelcomeScreen extends StatelessWidget {
  final AuthenticationController _authenticationController =
  Get.put(AuthenticationController());
   WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,

            )
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:   [
              const SizedBox(
                height: 120,
                width: 120,
                child: Image(image: AssetImage("assets/logo.png"),
                fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15,),
              CustomizedButton(
                buttonText: "Login",
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPress: () {
                  Get.to(() => (LoginScreen()));
                }, authenticationController: _authenticationController,
              ),
              CustomizedButton(
                buttonText: "Register",
                buttonColor: Colors.white,
                textColor: Colors.black,
                onPress: (){
                  Get.to(() => (RegistrationScreen()));
                },
                authenticationController: _authenticationController,
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
