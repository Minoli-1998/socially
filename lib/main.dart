import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socially_app/firebase_options.dart';
import 'package:socially_app/router/router.dart';
import 'package:socially_app/utils/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Socially",
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          unselectedItemColor: mainWhiteColor,
          selectedItemColor: mainOrangeColor,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: mainOrangeColor,
          contentTextStyle: TextStyle(fontSize: 16, color: mainWhiteColor),
        ),
      ),
      routerConfig: RouterClass().router,
    );
  }
}
