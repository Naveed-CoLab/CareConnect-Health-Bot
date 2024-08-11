import 'package:flutter/material.dart';

class CareconnectThemes {
  // Define your primary and secondary colors
  static const Color primaryColor = Color(0xFF0056c4); // Background color
  static const Color accentColor = Color(0xFFFE8715);  // Button color
  static const Color textColor = Colors.white;
  static const Color subtitleColor = Colors.white70;

  // Define your text styles
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 18,
    color: subtitleColor,
  );

  // Define your button style
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: accentColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
  );

  // Method to get the theme data for the entire app
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: primaryColor,
      hintColor: accentColor,
      scaffoldBackgroundColor: primaryColor,
      textTheme: const TextTheme(
        displayLarge: titleTextStyle,
        bodyLarge: subtitleTextStyle,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle,
      ),
    );
  }
}
