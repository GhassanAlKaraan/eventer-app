import 'package:eventer/pages/create_event_page.dart';
import 'package:eventer/pages/home_page.dart';
import 'package:eventer/services/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'pages/events_page.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigo[50],
      ),

      /// pages still to be added
      routes: {
        '/': (_) => const SplashScreen(),
        '/auth': (_) => const AuthGate(),
        '/home': (_) => const HomePage(),
        '/events': (_) => const EventsPage(),
        // '/eventdetails': (_) => EventDetailsPage(),
        '/createevent': (_) => const CreateEventPage(),
      },


    );
  }
}
