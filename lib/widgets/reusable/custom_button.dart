import 'package:flutter/material.dart';
import 'package:socially_app/utils/constants/colors.dart';

class AppCustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double width;
  const AppCustomButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradientColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(color: mainWhiteColor, fontSize: 16),
        ),
      ),
    );
  }
}
