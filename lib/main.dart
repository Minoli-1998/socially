import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/firebase_options.dart';
import 'package:socially_app/views/responsive/mobile_layout.dart';
import 'package:socially_app/views/responsive/responsive_layout.dart';
import 'package:socially_app/views/responsive/web_layout.dart';

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
      title: "Socially",
      home: ResponsiveLayoutScreen(
        mobileLayoutScreen: MobileLayoutScreen(),
        webLayoutScreen: WebLayoutScreen(),
      ),
    );
  }
}
