import 'package:app_seminario/core/theme_provider.dart';
import 'package:app_seminario/core/themes.dart';
import 'package:app_seminario/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(
        appBar: CustomAppBar(),
        body: Center(child: Text('Hello, World!')),
      ),
    );
  }
}
