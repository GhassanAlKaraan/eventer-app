import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.isObscure, required this.hintText, required this.controller});

  final bool isObscure;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      style: const TextStyle(fontSize: 20,),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          filled: true,
          fillColor: Colors.white,
        ),
    );
  }
}
