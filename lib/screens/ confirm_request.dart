import 'package:card_based_app/widgets/customized_field.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../custome/colorLibrary.dart';
import '../widgets/customized_button.dart';

class ConfirmRequest extends StatefulWidget {
  const ConfirmRequest({Key? key}) : super(key: key);
  @override
  State<ConfirmRequest> createState() => _ConfirmRequestState();
}

class _ConfirmRequestState extends State<ConfirmRequest> {
  void ShowAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: "Your request has been successfully submited",
      title: "AWESOME",
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // close keyboard when a tap is detected
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
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
                    children: const [
                      Text(
                        "Confirm your request",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Review your details clearly, you won't be able to revert this.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyCustomeColors.fieldColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Card Number",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "House Number",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Collection type",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Number of Package",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "TOTAL",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "1020304050",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: MyCustomeColors.LinkBlueColor),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "ZNZ/MJ/302-WEST",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: MyCustomeColors.LinkBlueColor),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Outside house",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: MyCustomeColors.LinkBlueColor),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: MyCustomeColors.LinkBlueColor),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "+255 626560698",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: MyCustomeColors.LinkBlueColor),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "3,00 Tsh",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: MyCustomeColors.LinkBlueColor,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomizedButton(
                  buttonText: "Submit your request",
                  buttonColor: Colors.black,
                  textColor: MyCustomeColors.fieldColor,
                  onPress: () {
                    ShowAlert();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
