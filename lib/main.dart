import 'package:eventer/pages/home_page.dart';
import 'package:eventer/services/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),

      ///pages still to be added
      routes: {
        '/': (_) => const SplashScreen(),
        '/auth': (_) => const AuthGate(),
        '/home': (_) => HomePage(),
        // '/events': (_) => EventsPage(),
        // '/eventdetails': (_) => EventDetailsPage(),
        // '/createevent': (_) => CreateEvent(),
      },


    );
  }
}
