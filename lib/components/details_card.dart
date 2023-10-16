import 'package:eventer/utility/constants.dart';
import 'package:flutter/material.dart';

//todo: design the details card

class DetailsCard extends StatelessWidget {
  final Map<String, dynamic> eventDetails;
  final Map<String, dynamic> organiserDetails;

  const DetailsCard({super.key, required this.eventDetails, required this.organiserDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1", style: kTxtStyle2),
          Text("2", style: kTxtStyle2),
          Text("3", style: kTxtStyle2),
          Text("4", style: kTxtStyle2),
          Text("5", style: kTxtStyle2),
          Text("6", style: kTxtStyle2),
          Text("7", style: kTxtStyle2),
        ],
      ),
    );
  }
}
