import 'package:card_based_app/custome/colorLibrary.dart';
import 'package:card_based_app/screens/link_card.dart';
import 'package:card_based_app/screens/welcome_screen.dart';
import 'package:card_based_app/widgets/bottom_navigation_Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/status_widget.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!; //access the user information

  @override
  Widget build(BuildContext context) {
    // final box = GetStorage();
    // var token = box.read('token');
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationWidget(),
        backgroundColor: MyCustomeColors.fieldColor,
        body: Column(
          children: [
            IntrinsicHeight(
              child: Container(
                width: double.infinity,
                //height: 225,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  //heading column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        // 'Hi ${user.email}',
                        'Hi there',
                        style:   TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: MyCustomeColors.fieldColor,
                        ),
                      ),
                      Text(
                        "Have you take out a trash today? ${user.email}",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: MyCustomeColors.fieldColor),
                      ),
                      const SizedBox(
                          height:
                              30), // Add some space between the last Text widget and the Row widget
                      //searching row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              //height: 44,
                              //width: 299,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: MyCustomeColors.fieldColor,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Search here",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              FirebaseAuth.instance.signOut(); //signning out
                              Get.to(() => WelcomeScreen());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: MyCustomeColors.fieldColor,
                              ),
                              child: const Icon(
                                Icons.message,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ), //end of searching row
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                  //end of heading column
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Card Status",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  StatusWidget(
                    statusColor: MyCustomeColors.activeColor,
                    statusName: "active",
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LinkCardScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Card Number",
                            style: TextStyle(
                              fontSize: 13,
                              color: MyCustomeColors.fieldColor,
                            ),
                          ),
                          Text(
                            "Card balance",
                            style: TextStyle(
                              fontSize: 13,
                              color: MyCustomeColors.fieldColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "1020304050",
                            style: TextStyle(
                                fontSize: 18,
                                color: MyCustomeColors.fieldColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "20,100 Tsh",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyCustomeColors.fieldColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recycling tips",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.recycling)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
