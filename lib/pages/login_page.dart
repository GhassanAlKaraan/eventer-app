import 'package:eventer/components/loading_button.dart';
import 'package:eventer/components/my_button.dart';
import 'package:eventer/components/my_textfield.dart';
import 'package:eventer/utility/constants.dart';
import 'package:eventer/utility/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../other/auth_exception_handler.dart';
import '../other/auth_results_status.dart';
import '../other/firebase_auth_helper.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text fields controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Future<void> login() async {
  //   //Get the values from the text fields
  //   final email = emailController.text.trim();
  //   final password = passwordController.text.trim();
  //   if (email.isEmpty || password.isEmpty) {
  //     Utility.showSnackBar(context, "Please fill in all fields");
  //     return;
  //   }
  //
  //   try {
  //     await context
  //         .read<AuthService>()
  //         .signInWithEmailAndPassword(email, password);
  //
  //   }on FirebaseAuth catch (e) {
  //     Utility.showSnackBar(context, '$e.code');
  //
  //     // if (e.code == 'user-not-found') {
  //     //   Utility.showAlert(context, "User not found");
  //     // } else if (e.code == 'invalid-email') {
  //     //   Utility.showAlert(context, "Invalid email.");
  //     // } else {
  //     //   Utility.showAlert(context, "Check your credentials.");
  //     // }
  //   }
  //
  // }

  _login() async {
    _toggleButtonState();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Utility.showSnackBar(context, "Please fill in all fields");
      _toggleButtonState();
      return;
    }

    try {
      //todo: use the provider auth service
      final status =
          await FirebaseAuthHelper().login(email: email, pass: password);

      if (status == AuthResultStatus.successful) {
        Utility.showSnackBar(context, "Success");
        // AuthGate will Navigate to HomePage page after success
      } else {
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        Utility.showAlert(context, errorMsg);
      }
    } catch (e) {
      print("$e.message");
    } finally {
      _toggleButtonState();
    }
  }

  bool isButtonClicked = false;

  void _toggleButtonState() {
    setState(() {
      isButtonClicked = !isButtonClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 48),
                SizedBox(
                  height: 100,
                  child: Image.asset("assets/images/mask_logo.png",
                      fit: BoxFit.contain),
                ),
                const SizedBox(height: 48),
                const Text("Welcome", style: kTxtStyle2),
                const SizedBox(height: 48),
                MyTextField(
                  isObscure: false,
                  hintText: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 42),
                MyTextField(
                  isObscure: true,
                  hintText: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 52),
                isButtonClicked
                    ? LoadingButton(text: "Loading", onTap: () {})
                    : MyButton(text: "Log In", onTap: _login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
