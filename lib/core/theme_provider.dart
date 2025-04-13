import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Color _customPrimaryColor = AppColors.primary;
  String _customFont = 'Inter';

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  Color get primaryColor => _customPrimaryColor;
  String get font => _customFont;

  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setCustomPrimaryColor(Color color) {
    _customPrimaryColor = color;
    notifyListeners();
  }

  void setCustomFont(String fontName) {
    _customFont = fontName;
    notifyListeners();
  }

  ThemeData get lightTheme => AppTheme.lightTheme.copyWith(
    colorScheme: AppTheme.lightTheme.colorScheme.copyWith(
      primary: _customPrimaryColor,
    ),
    appBarTheme: AppTheme.lightTheme.appBarTheme.copyWith(
      backgroundColor: _customPrimaryColor,
    ),
    textTheme: GoogleFonts.getTextTheme(
      _customFont,
      AppTheme.lightTheme.textTheme,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _customPrimaryColor,
        foregroundColor: AppColors.textDark,
      ),
    ),
    drawerTheme: AppTheme.lightTheme.drawerTheme.copyWith(
      backgroundColor: _customPrimaryColor,
    ),
    inputDecorationTheme: AppTheme.lightTheme.inputDecorationTheme.copyWith(
      fillColor: _customPrimaryColor.withAlpha(95),
    ),
  );

  ThemeData get darkTheme => AppTheme.darkTheme.copyWith(
    colorScheme: AppTheme.darkTheme.colorScheme.copyWith(
      primary: _customPrimaryColor,
    ),
    appBarTheme: AppTheme.darkTheme.appBarTheme.copyWith(
      backgroundColor: _customPrimaryColor,
    ),
    textTheme: GoogleFonts.getTextTheme(
      _customFont,
      AppTheme.darkTheme.textTheme,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _customPrimaryColor,
        foregroundColor: AppColors.textDark,
      ),
    ),
    drawerTheme: AppTheme.lightTheme.drawerTheme.copyWith(
      backgroundColor: _customPrimaryColor,
    ),
    inputDecorationTheme: AppTheme.darkTheme.inputDecorationTheme.copyWith(
      fillColor: _customPrimaryColor.withAlpha(95),
    ),
  );
}
