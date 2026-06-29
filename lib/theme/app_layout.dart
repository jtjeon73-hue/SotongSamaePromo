import 'package:flutter/material.dart';

abstract final class AppLayout {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= 600 && w < 900;
  }

  static bool isWide(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 900;

  static double horizontalPadding(BuildContext context) {
    if (isMobile(context)) return 18;
    if (isTablet(context)) return 24;
    return 32;
  }

  static double sectionVerticalPadding(BuildContext context) {
    if (isMobile(context)) return 40;
    if (isTablet(context)) return 48;
    return 64;
  }

  static double titleSize(BuildContext context) {
    if (isMobile(context)) return 26;
    if (isTablet(context)) return 30;
    return 34;
  }
}
