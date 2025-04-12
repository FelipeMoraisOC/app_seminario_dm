import 'package:app_seminario/core/theme_provider.dart';
import 'package:app_seminario/core/themes.dart';
import 'package:app_seminario/widgets/custom_app_bar.dart';
import 'package:app_seminario/widgets/custom_bottom_navigation.dart';
import 'package:app_seminario/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'App de Cursos',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.robotoCondensedTextTheme(
          AppTheme.lightTheme.textTheme,
        ),
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        textTheme: GoogleFonts.robotoCondensedTextTheme(
          AppTheme.darkTheme.textTheme,
        ),
      ),
      home: const Scaffold(
        drawer: CustomDrawer(userName: "Maria Silva", userImage: ''),
        appBar: CustomAppBar(),
        body: CustomBottomNavigation(),
      ),
    );
  }
}
