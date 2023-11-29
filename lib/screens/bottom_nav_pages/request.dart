import 'package:card_based_app/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

import '../ confirm_request.dart';
import '../../custome/colorLibrary.dart';
import '../../widgets/customized_button.dart';
import '../../widgets/customized_field.dart';
import '../link_card.dart';

class RequestBottomNav extends StatefulWidget {
  const RequestBottomNav({Key? key}) : super(key: key);

  @override
  State<RequestBottomNav> createState() => _RequestBottomNavState();
}
class _RequestBottomNavState extends State<RequestBottomNav> {

  final TextEditingController _houseNumber = TextEditingController();
  final TextEditingController _package = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "Requesting Recycling Service",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 22,
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
                const CustomizedDropdown(),
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
                // CustomizedButton(
                //   buttonColor: Colors.black,
                //   buttonText: "Proceed",
                //   textColor: Colors.white,
                //   onPress: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => const ConfirmRequest()),
                //       );
                //   }, authenticationController: null,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
