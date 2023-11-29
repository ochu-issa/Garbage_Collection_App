import 'package:card_based_app/controllers/app_service_controller.dart';
import 'package:card_based_app/controllers/authentication.dart';
import 'package:card_based_app/custome/colorLibrary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import ' confirm_request.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_field.dart';

class LinkCardScreen extends StatefulWidget {
  const LinkCardScreen({Key? key}) : super(key: key);

  @override
  State<LinkCardScreen> createState() => _LinkCardScreenState();
}

class _LinkCardScreenState extends State<LinkCardScreen> {
  final TextEditingController _cardNumber = TextEditingController();
  final AppServiceController _appServiceController = Get.put(AppServiceController());
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
              decoration: const BoxDecoration(
                color: MyCustomeColors.backgroundColor,
              ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Link card",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  CustomizedField(
                    myController: _cardNumber,
                    hintText: "Card Number",
                    isPassword: false,
                  ),
                  // CustomizedButton(
                  //   buttonColor: Colors.black,
                  //   buttonText: "Link card",
                  //   textColor: Colors.white,
                  //   onPress: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const ConfirmRequest()),
                  //     );
                  //   }, authenticationController: _appServiceController,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
