import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPress;
  // final AuthenticationController _authenticationController =
  // Get.put(AuthenticationController());
  final AuthenticationController authenticationController;

  const CustomizedButton({Key? key, this.buttonText, this.buttonColor, this.onPress, this.textColor, required this.authenticationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Center(
            child: Obx(() {
                return authenticationController.isLoading.value
                  ?  const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
                  :Text(
                  buttonText!,
                  style: TextStyle(color: textColor, fontSize: 20),);
              }
            ),),
        ),
      ),
    );
  }
}
