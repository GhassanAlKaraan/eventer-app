import 'package:eventer/components/my_button2.dart';
import 'package:eventer/pages/create_event_page.dart';
import 'package:eventer/services/firebase/auth/firebase_auth_helper.dart';
import 'package:eventer/utility/constants.dart';
import 'package:eventer/utility/utils.dart';
import 'package:flutter/material.dart';

import 'events_page.dart';

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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Home Page", style: kTxtStyle3),
          const SizedBox(height: 10.0),
          MyButton2(
              text: "Create Event",
              onTap: () {
                Utility.launchPage(context, const CreateEventPage());
              }),
          const SizedBox(height: 10.0),
          MyButton2(
              text: "See Events",
              onTap: () {
                Utility.launchPage(context, const EventsPage());
              }),
        ],
      )),
    );
  }
}
