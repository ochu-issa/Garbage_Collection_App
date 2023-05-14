import 'package:card_based_app/screens/%20confirm_request.dart';
import 'package:card_based_app/screens/link_card.dart';
import 'package:flutter/material.dart';

import '../custome/colorLibrary.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_field.dart';
import 'login_screen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final TextEditingController _houseNumber = TextEditingController();
  final TextEditingController _collectionType = TextEditingController();
  final TextEditingController _package = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        const Text(
                          "Requesting Recycling Service",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Before requesting make sure your card is linked to \nthis device",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LinkCardScreen()),
                            );
                          },
                          child: const Text(
                            "link the card here",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: MyCustomeColors.LinkBlueColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomizedField(
                      myController: _houseNumber,
                      hintText: "House Number",
                      isPassword: false,
                  ),
                  CustomizedField(
                    myController: _collectionType,
                    hintText: "Collection type",
                    isPassword: false,
                  ),
                  CustomizedField(
                    myController: _package,
                    hintText: "How many package?",
                    isPassword: false,
                  ),
                  CustomizedField(
                    myController: _phoneNumber,
                    hintText: "Phone Number",
                    isPassword: false,
                  ),
                  CustomizedButton(
                    buttonColor: Colors.black,
                    buttonText: "Proceed",
                    textColor: Colors.white,
                    onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConfirmRequest()),
                        );
                    },
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
