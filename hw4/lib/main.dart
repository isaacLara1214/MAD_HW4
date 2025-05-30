import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hw4/firebase_options.dart';
import 'theme/light_mode.dart';
import 'services/authentication/auth_gate.dart';

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
      debugShowCheckedModeBanner: false,
      theme: lightMode, // Apply your custom light theme
      home: AuthGate(),
    );
  }
}
