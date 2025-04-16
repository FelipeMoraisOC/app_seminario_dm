import 'package:app_seminario/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.backgroundLight,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonLight,
        foregroundColor: AppColors.textLight,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: AppColors.backgroundDark,
      elevation: 4,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardLight,
      labelStyle: TextStyle(color: AppColors.textLight),
      floatingLabelStyle: TextStyle(color: AppColors.textLight),
      hintStyle: TextStyle(color: AppColors.textLight),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor:
          AppColors.backgroundDark, // Cor do cursor// Cor do "pino" de seleção
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.backgroundDark,
      onPrimary: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonDark,
        foregroundColor: AppColors.textDark,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardDark,
      shadowColor: AppColors.backgroundDark,
      elevation: 4,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      labelStyle: TextStyle(color: AppColors.textDark),
      floatingLabelStyle: TextStyle(color: AppColors.textDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor:
          AppColors.textDark, // Cor do cursor// Cor do "pino" de seleção
    ),
  );
}
