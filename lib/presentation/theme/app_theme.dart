import 'package:flutter/material.dart';

class AppTheme {
  static const Color iMessageBlue = Color(0xFF208CFF);
  static const Color receiverGray = Color(0xFFE9E9EB);
  static const Color backgroundLight = Colors.white;
  static const Color textDark = Colors.black;
  static const Color textLight = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: iMessageBlue,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: iMessageBlue,
        secondary: iMessageBlue,
        surface: backgroundLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundLight,
        elevation: 0,
        iconTheme: IconThemeData(color: iMessageBlue),
        titleTextStyle: TextStyle(
          color: textDark,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 17,
          color: textDark,
          letterSpacing: -0.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: textDark,
          letterSpacing: -0.2,
        ),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      useMaterial3: true,
    );
  }
}
