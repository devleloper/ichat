import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const Color iMessageBlue = Color(0xFF208CFF);
  static const Color receiverGray = Color(0xFFE9E9EB);
  static const Color backgroundPrimary = Colors.white;
  static const Color backgroundSecondary = Color(0xFFF2F2F7);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color secondaryLabel = Color(0xFF8E8E93);
  static const Color separator = Color(0xFFE5E5EA);
  static const Color inputBorder = Color(0xFFC6C6C8);
  static const Color destructiveRed = Color(0xFFFF3B30);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: iMessageBlue,
      scaffoldBackgroundColor: backgroundPrimary,
      colorScheme: const ColorScheme.light(
        primary: iMessageBlue,
        secondary: iMessageBlue,
        surface: backgroundPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundPrimary,
        elevation: 0,
        iconTheme: IconThemeData(color: iMessageBlue),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 17,
          color: textPrimary,
          letterSpacing: -0.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: textPrimary,
          letterSpacing: -0.2,
        ),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      useMaterial3: true,
    );
  }
}

extension ThemeColorsExt on BuildContext {
  Color get bgPrimary => AppTheme.backgroundPrimary;
  Color get bgSecondary => AppTheme.backgroundSecondary;
  Color get textMain => AppTheme.textPrimary;
  Color get textSecondary => AppTheme.secondaryLabel;
  Color get separatorColor => AppTheme.separator;
  Color get inputBorderColor => AppTheme.inputBorder;
  Color get receiverBubble => AppTheme.receiverGray;
}
