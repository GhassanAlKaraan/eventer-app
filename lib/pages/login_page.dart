import 'package:eventer/components/my_button.dart';
import 'package:eventer/components/my_textfield.dart';
import 'package:eventer/utility/constants.dart';
import 'package:eventer/utility/utils.dart';
import 'package:flutter/material.dart';

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
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/images/mask_logo.png",
                    fit: BoxFit.contain,
                  ), //todo: import image
                ),
                const SizedBox(
                  height: 48,
                ),
                const Text("Welcome", style: kTxtStyle2),
                const SizedBox(
                  height: 48,
                ),
                MyTextField(
                  isObscure: false,
                  hintText: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 42,
                ),
                MyTextField(
                  isObscure: true,
                  hintText: "Password",
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 52,
                ),
                MyButton(
                    text: "Log In",
                    onTap: () {
                      //todo: implement login
                      Utility.showSnackBar(context, "Login Button Pressed");
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
