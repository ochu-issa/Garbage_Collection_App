import 'package:card_based_app/custome/colorLibrary.dart';
import 'package:card_based_app/widgets/bottom_navigation_Widget.dart';
import 'package:flutter/material.dart';


import '../widgets/status_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                        "Hi Ochu!",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: MyCustomeColors.fieldColor),
                      ),
                      const Text(
                        "Have you take out a trash today?",
                        style: TextStyle(
                            fontSize: 12,
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
                              child: Row(
                                children: const [
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
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: MyCustomeColors.fieldColor,
                            ),
                            child: const Icon(
                              Icons.message,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ), //end of searching row
                      const SizedBox(height: 35, ),
                    ],
                  ),
                  //end of heading column
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                   Text(
                    "Card Status",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                   SizedBox(width: 10,),
                   StatusWidget(
                     statusColor: MyCustomeColors.activeColor,
                     statusName: "active",
                   ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Card Number",
                        style: TextStyle(
                          fontSize: 13,
                          color: MyCustomeColors.fieldColor,
                        ),),
                        Text("Card balance",
                          style: TextStyle(
                            fontSize: 13,
                            color: MyCustomeColors.fieldColor,),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("1020304050",
                          style: TextStyle(
                            fontSize: 18,
                            color: MyCustomeColors.fieldColor,
                            fontWeight: FontWeight.bold
                          ),),
                        Text("20,100 Tsh",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyCustomeColors.fieldColor,),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Recycling tips",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,

                    ),
                  ),
                  SizedBox(width: 10,),
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
