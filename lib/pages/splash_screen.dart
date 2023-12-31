import 'dart:async';

import 'package:eventer/animations/calendar_anim.dart';
import 'package:eventer/utility/constants.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Timer startTimer() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  void route() {
    Navigator.pushReplacementNamed(context, '/auth');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Welcome to Eventer", style: kTxtStyle3,),
            const SizedBox(height: 20,),
            const Text("by Ghassan", style: kTxtStyle1b,),
            const SizedBox(height: 30,),
            CalendarAnimation(),
          ],
        ),
      ),
    );
  }
}
