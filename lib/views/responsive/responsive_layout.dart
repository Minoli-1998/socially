import 'package:flutter/material.dart';
import 'package:socially_app/utils/constants/constants.dart';

class ResponsiveLayoutScreen extends StatefulWidget {
  final Widget mobileLayoutScreen;
  final Widget webLayoutScreen;

  const ResponsiveLayoutScreen({
    super.key,
    required this.mobileLayoutScreen,
    required this.webLayoutScreen,
  });

  @override
  State<ResponsiveLayoutScreen> createState() => _ResponsiveLayoutScreenState();
}

class _ResponsiveLayoutScreenState extends State<ResponsiveLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenMinWidth) {
          return widget.webLayoutScreen;
        } else {
          return widget.mobileLayoutScreen;
        }
      },
    );
  }
}
