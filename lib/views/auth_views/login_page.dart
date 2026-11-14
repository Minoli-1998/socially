import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socially_app/utils/constants/colors.dart';
import 'package:socially_app/widgets/reusable/custom_button.dart';
import 'package:socially_app/widgets/reusable/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // fields
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                // logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("lib/assets/images/logo.png"),
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomInput(
                        controller: _nameController,
                        labelText: "Name",
                        icon: Icons.person,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10),

                      CustomInput(
                        controller: _emailController,
                        labelText: "Email",
                        icon: Icons.email,
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10),

                      AppCustomButton(
                        text: "Log in",
                        width: double.infinity,
                        onPressed: () {},
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign in with Google to access the app's features",
                          style: TextStyle(color: secondaryColor, fontSize: 14),
                        ),
                      ),

                      SizedBox(height: 10),

                      AppCustomButton(
                        text: "Sign in with Google",
                        width: double.infinity,
                        onPressed: () {},
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).pushReplacement('/register');
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(color: secondaryColor, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
