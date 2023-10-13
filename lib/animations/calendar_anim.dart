// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CalendarAnimation extends StatelessWidget {
  CalendarAnimation({super.key});

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Lottie.asset(
        'assets/animations/calendar_animation.json',
        fit: BoxFit.fill,
      ),
    );
  }
}