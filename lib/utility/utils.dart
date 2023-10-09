import 'package:flutter/material.dart';

class Utility {

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3), // Optional: Set the duration
        action: SnackBarAction(label: 'Close', onPressed: () {}),
      ),
    );
  }

  static Future<void> showAlertDialog(
      BuildContext context, VoidCallback customFunction, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: const Text('Are you sure?', style: TextStyle(fontSize: 20),),
          actions: [

            TextButton(
              child: const Text('Cancel', style: TextStyle(fontSize: 18),),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('YES', style: TextStyle(fontSize: 18),),
              onPressed: () {
                // Add your OK button action here
                customFunction();
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // static void openPage(BuildContext context, Widget page) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => page));
  // }

  // static void goToPage(BuildContext context, String routeName) {
  //   Navigator.pushReplacementNamed(context, routeName);
  // }

  static void showLoading(BuildContext context){
    //Show loading animation
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}