import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final Color? statusColor;
  final String? statusName;
  const StatusWidget({Key? key, this.statusColor, this.statusName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 13,
      decoration: BoxDecoration(
          color: statusColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
           const SizedBox(width: 3,),
          Text(
            statusName!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
