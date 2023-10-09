import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventer',
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (_) => const SplashScreen(),
        '/auth': (_) => const LoginPage(), //todo: implement full auth module
        // '/home': (_) => HomePage(),
        // '/events': (_) => EventsPage(),
        // '/eventdetails': (_) => EventDetailsPage(),
        // '/createevent': (_) => CreateEvent(),
      },


    );
  }
}
