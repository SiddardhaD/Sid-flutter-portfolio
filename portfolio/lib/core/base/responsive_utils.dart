import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double baseWidth = 1440;
  static const double baseHeight = 900;
  static double w(BuildContext context, double width) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (width / baseWidth) * screenWidth;
  }

  static double h(BuildContext context, double height) {
    final screenHeight = MediaQuery.of(context).size.height;
    return (height / baseHeight) * screenHeight;
  }

  static double f(BuildContext context, double fontSize) {
    final screenHeight = MediaQuery.of(context).size.height;
    return (fontSize / baseHeight) * screenHeight;
  }

  static double r(BuildContext context, double radius) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (radius / baseWidth) * screenWidth;
  }

  static double p(BuildContext context, double value) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (value / baseWidth) * screenWidth;
  }

  static bool isSmallDevice(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isLargeDevice(BuildContext context) =>
      MediaQuery.of(context).size.width > 1920;
}
