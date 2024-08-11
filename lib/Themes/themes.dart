import 'package:flutter/material.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 26.0;
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.grey, // Subtle shadow
    color: Color(0xff00A86B), // Teal color for AppBar
  ),
  colorScheme: const ColorScheme.light(
    surface: Color(0xffffffff),
    primary: Color(0xff00A86B), // Teal for primary color
    secondary: Color(0xffF5F5F5), // Light gray for secondary color
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xff00A86B)), // Teal color for labels
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Color(0xff333333), fontSize: FontSizes.doubleExtraLarge, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: Color(0xff333333), fontSize: FontSizes.extraLarge, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      color: Color(0xff333333),
      fontSize: FontSizes.standard,
    ),
    bodyMedium: TextStyle(
      color: Color(0xff333333),
      fontSize: FontSizes.small,
    ),
    titleMedium: TextStyle(
      color: Color(0xff333333),
      fontSize: FontSizes.small,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Color(0xff333333),
      fontSize: FontSizes.extraSmall,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    shadowColor: Color(0xff333333), // Darker shadow
    color: Color(0xff004d40), // Dark teal for AppBar
  ),
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff121212),
    primary: Color(0xff004d40), // Dark teal for primary color
    secondary: Color(0xff424242), // Dark gray for secondary color
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xff004d40)), // Dark teal color for labels
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Color(0xffE0E0E0), fontSize: FontSizes.doubleExtraLarge, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: Color(0xffE0E0E0), fontSize: FontSizes.extraLarge, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      color: Color(0xffE0E0E0),
      fontSize: FontSizes.standard,
    ),
    bodyMedium: TextStyle(
      color: Color(0xffE0E0E0),
      fontSize: FontSizes.small,
    ),
    titleMedium: TextStyle(
      color: Color(0xffE0E0E0),
      fontSize: FontSizes.small,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Color(0xffE0E0E0),
      fontSize: FontSizes.extraSmall,
    ),
  ),
);
