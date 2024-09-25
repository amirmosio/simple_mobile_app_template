import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/headings.dart';

class BBTheme {
  static ThemeData get theme {
    return ThemeData(
        fontFamily: "Lato",
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedLabelStyle: H1TextStyle(), unselectedLabelStyle: H1TextStyle()));
  }
}
