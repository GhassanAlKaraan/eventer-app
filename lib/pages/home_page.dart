import 'package:eventer/services/firebase/auth/firebase_auth_helper.dart';
import 'package:eventer/utility/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void signOut() {
    FirebaseAuthHelper().logout();
  }


  //End of Sign out method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
