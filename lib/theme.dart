import 'package:flutter/material.dart';

class AppTheme {
  static const Color bgCream = Color(0xFFFAF7F2);
  static const Color textDark = Color(0xFF2C1D11);
  static const Color textLight = Color(0xFF6B5E55);
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF5E6C8);
  static const Color buttonDark = Color(0xFF23150C);
  static const Color cardBg = Colors.white;
  static const Color successGreen = Color(0xFF34A853);
  static const Color warningOrange = Color(0xFFF2994A);
  static const Color dividerColor = Color(0xFFE8E0D5);

  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: bgCream,
    primaryColor: gold,
    fontFamily: 'Georgia', 
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: textDark, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: textDark, fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: textDark, fontSize: 20, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: textDark, fontSize: 16),
      bodyMedium: TextStyle(color: textLight, fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: gold),
    ),
  );
}
