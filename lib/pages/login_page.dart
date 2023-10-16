import 'package:eventer/components/loading_button.dart';
import 'package:eventer/components/my_button.dart';
import 'package:eventer/components/my_textfield.dart';
import 'package:eventer/utility/constants.dart';
import 'package:eventer/utility/utils.dart';
import 'package:flutter/material.dart';
import '../services/firebase/auth/auth_exceptions/auth_exception_handler.dart';
import '../services/firebase/auth/auth_exceptions/auth_results_status.dart';
import '../services/firebase/auth/firebase_auth_helper.dart';

//todo: add registration module.

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

  void _login() async {
    _toggleButtonState();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Utility.showSnackBar(context, "Please fill in all fields");
      _toggleButtonState();
      return;
    }

    try {
      //clean up code.
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
                const Text("Members Only", style: kTxtStyle2),
                const SizedBox(height: 48),
                MyTextField(
                  isObscure: false,
                  labelText: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 42),
                MyTextField(
                  isObscure: true,
                  labelText: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 52),
                isButtonClicked
                    ? const LoadingButton(text: "Loading")
                    : MyButton(text: "Log In", onTap: _login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
