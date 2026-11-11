import 'package:flutter/material.dart';
import 'package:socially_app/utils/constants/colors.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final bool obscureText;

  const CustomInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.textInputType,
    required this.obscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: primaryColor, fontSize: 16),
        prefixIcon: Icon(icon, color: primaryColor, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: Divider.createBorderSide(context),
        ),
        filled: true,
        fillColor: mobileSearchColor,
      ),
      keyboardType: textInputType,
    );
  }
}
