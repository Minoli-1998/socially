import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socially_app/views/auth_views/register_page.dart';
import 'package:socially_app/views/responsive/mobile_layout.dart';
import 'package:socially_app/views/responsive/responsive_layout.dart';
import 'package:socially_app/views/responsive/web_layout.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: '/register',
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(body: Center(child: Text("The page is not found"))),
      );
    },
    routes: [
      // initial route
      GoRoute(
        path: '/',
        name: "Main page",
        builder: (context, state) {
          return ResponsiveLayoutScreen(
            mobileLayoutScreen: MobileLayoutScreen(),
            webLayoutScreen: WebLayoutScreen(),
          );
        },
      ),

      // register page
      GoRoute(
        path: '/register',
        name: "Register",
        builder: (context, state) {
          return RegisterPage();
        },
      ),
    ],
  );
}
