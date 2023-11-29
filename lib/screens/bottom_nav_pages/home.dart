import 'package:card_based_app/custome/colorLibrary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authentication.dart';
import '../../widgets/status_widget.dart';
import '../link_card.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {

  final AuthenticationController _authenticationController = Get.put(AuthenticationController());
  String name = "";


@override
  void initState() {
    // TODO: implement initState
    super.initState();
   // fetchData();
  }

  // fetchData(){
  //   print("initial");
  //   Future.delayed(Duration(seconds: 3)).then((value){
  //     setState(() {
  //       name="David";
  //     });
  //   });
  //
  //   Future.delayed(Duration(seconds: 6)).then((value){
  //     setState(() {
  //       name="Kide";
  //     });
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Text(
                    // 'Hi ${user.email}',
                    'Hi there,'+name,
                    style:   TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: MyCustomeColors.fieldColor,
                    ),
                  ),
                  const Text(
                    "Have you take out a trash today?",
                    style:  TextStyle(
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
                        onTap: () async {
                          await _authenticationController.logout();
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
        // Expanded(
        //   child: screen.elementAt(_selectedIndex),
        // ),
      ],
    );
  }
}
