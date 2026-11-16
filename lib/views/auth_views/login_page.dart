import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socially_app/services/auth/auth_service.dart';
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

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // login user with email and password
  Future<void> _loginWithEmailAndPassword(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await AuthService().signInWithEmailPasssword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // display message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logged in"), duration: Duration(seconds: 1)),
      );

      // clear fields
      _emailController.clear();
      _passwordController.clear();

      Future.delayed(Duration(seconds: 2));

      // navigate to main screen
      GoRouter.of(context).go('/main-screen');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error in login with email and password : $error"),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  // sign in with google
  Future<void> _signInWithGoogle(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await AuthService().signInWithGoogle();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signed in with Google"),
          duration: Duration(seconds: 1),
        ),
      );
    } catch (error) {
      print("Error in sign in with google : $error");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error in signing with google : $error"),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

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

                      CustomInput(
                        controller: _passwordController,
                        labelText: "Password",
                        icon: Icons.lock,
                        textInputType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          if (value.length < 6) {
                            return "Your password length must be more than 6 characters";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10),

                      AppCustomButton(
                        text: "Log in",
                        width: double.infinity,
                        onPressed: () async {
                          await _loginWithEmailAndPassword(context);
                        },
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
                        onPressed: () async {
                          await _signInWithGoogle(context);
                        },
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
