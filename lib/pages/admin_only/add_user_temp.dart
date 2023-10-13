import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventer/components/my_button.dart';
import 'package:eventer/components/my_textfield.dart';
import 'package:flutter/material.dart';

import '../../utility/utils.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future _addUser() async {
    if (emailController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      Utility.showSnackBar(context, "Please fill in all fields");
      return;
    }

    await firestore.collection('users').doc(emailController.text.trim()).set({
      'email': emailController.text.trim(),
      'firstName': firstNameController.text.trim(),
      'lastName': lastNameController.text.trim(),
      'phoneNumber': phoneNumberController.text.trim(),
    }).then((value) {
      print("User Added");
      Utility.showSnackBar(context, "User Added");
      Navigator.pop(context);
    }).catchError((_) {
      print("Could not add User");
      Utility.showSnackBar(context, "Could not add User");
    });

    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyTextField(
                isObscure: false,
                labelText: "Email",
                controller: emailController),
            const SizedBox(height: 20.0),
            MyTextField(
                isObscure: false,
                labelText: "First Name",
                controller: firstNameController),
            const SizedBox(height: 20.0),
            MyTextField(
                isObscure: false,
                labelText: "Last Name",
                controller: lastNameController),
            const SizedBox(height: 20.0),
            MyTextField(
                isObscure: false,
                labelText: "Phone number",
                controller: phoneNumberController),
            const SizedBox(height: 20.0),
            MyButton(text: "Add User", onTap: _addUser),
          ],
        ),
      ),
    );
  }
}
