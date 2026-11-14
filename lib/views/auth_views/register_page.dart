import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socially_app/utils/constants/colors.dart';
import 'package:socially_app/widgets/reusable/custom_button.dart';
import 'package:socially_app/widgets/reusable/custom_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // fields
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  File? _imageFile;

  // method to pick image
  Future<void> _pickImage(ImageSource source) async {
    // create an instance of ImagePicker
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
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
                      Stack(
                        alignment: AlignmentGeometry.bottomRight,
                        children: [
                          _imageFile != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundColor: mainPurpleColor,
                                  backgroundImage: FileImage(_imageFile!),
                                )
                              : CircleAvatar(
                                  radius: 64,
                                  backgroundColor: mainPurpleColor,
                                  backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/vector-1742875355318-00d715aec3e8?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
                                  ),
                                ),

                          IconButton(
                            onPressed: () async {
                              _pickImage(ImageSource.gallery);
                            },
                            icon: Icon(Icons.add_a_photo),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

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

                      CustomInput(
                        controller: _jobTitleController,
                        labelText: "Job Title",
                        icon: Icons.work,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your job title";
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
                            return "Please enter your job password";
                          }
                          if (value.length < 6) {
                            return "Your password length must be more than 6 characters";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10),

                      CustomInput(
                        controller: _confirmPasswordController,
                        labelText: "Confirm Password",
                        icon: Icons.lock,
                        textInputType: TextInputType.text,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your job password";
                          }
                          if (value != _passwordController.text) {
                            return "Please enter the same password";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10),

                      AppCustomButton(
                        text: "Sign Up",
                        width: double.infinity,
                        onPressed: () {},
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).pushReplacement('/login');
                        },
                        child: Text(
                          "Already have an account? Log in",
                          style: TextStyle(color: primaryColor, fontSize: 14),
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
