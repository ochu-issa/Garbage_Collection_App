import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custome/colorLibrary.dart';

class CustomizedDropdown extends StatefulWidget {
 const CustomizedDropdown({Key? key}) : super(key: key);

  @override
  State<CustomizedDropdown> createState() => _CustomizedDropdownState();
}

class _CustomizedDropdownState extends State<CustomizedDropdown> {

  String? _dropdownValue;
  String? _dropboxValue;
  // void dropDownCallback(String? selectedValue){
  //   if(selectedValue is String){
  //     setState(() {
  //       _dropdownValue = selectedValue;
  //       _dropboxValue = selectedValue;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: MyCustomeColors.fieldColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton(
          items: const[
            //DropdownMenuItem(value: '--Collection Type--',child: Text('--Collection Type--'),),
            DropdownMenuItem(value: 'Outside House',child: Text('Outside House'),),
            DropdownMenuItem(value: 'Inside House',child: Text('Inside House'),),],
          value: _dropdownValue,
          // onChanged: dropDownCallback,
          onChanged: (String? value) => setState(() {
            _dropdownValue = value ?? "--Collection Type--";
            _dropboxValue = value;
          }),

          isExpanded: true,
          style: const TextStyle(
            color: MyCustomeColors.darkGrey,
            fontSize: 16,
          ),
          icon: const Icon(
            Icons.arrow_drop_down_circle,
            color: MyCustomeColors.darkGrey,
          ),
          dropdownColor: MyCustomeColors.fieldColor,
        ),
      ),
    );
  }
}
