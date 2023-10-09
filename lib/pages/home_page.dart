import 'package:eventer/utility/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Instance of Auth
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign out method
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  //End of Sign out method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Home Page"),
        actions: [
          //Sign Out Button
          IconButton(
            onPressed: () {
              Utility.showAlertDialog(context, signOut, "Sign Out");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
          child: Text(
        "Home Page",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      )),
    );
  }
}
