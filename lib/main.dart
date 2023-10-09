import 'package:eventer/services/auth_gate.dart';
import 'package:eventer/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'pages/login_page.dart';
import 'pages/splash_screen.dart';

void main() async {
  //async, cause there's an await inside method

  // Ensure initializing flutter mechanics, to avoid any initialization-related issues
  WidgetsFlutterBinding.ensureInitialized();
  // Wait until Firebase is fully initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp(),
  ));
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
        '/auth': (_) => const AuthGate(),
        // '/home': (_) => HomePage(),
        // '/events': (_) => EventsPage(),
        // '/eventdetails': (_) => EventDetailsPage(),
        // '/createevent': (_) => CreateEvent(),
      },


    );
  }
}
