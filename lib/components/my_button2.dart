import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  const MyButton2({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.indigoAccent),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.indigoAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
