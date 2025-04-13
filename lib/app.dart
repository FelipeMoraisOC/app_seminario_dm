import 'package:app_seminario/core/theme_provider.dart';
import 'package:app_seminario/core/themes.dart';
import 'package:app_seminario/modules/home/home_screen.dart';
import 'package:app_seminario/modules/personalizacao/personalizacao_screen.dart';
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
      initialRoute: '/',
      routes: {
        //'/configuracoes': (context) => const ConfiguracoesScreen(),
        //'/perfil': (context) => const MeuPerfilScreen(),
        '/personalizacao': (context) => const PersonalizacaoScreen(),
      },
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      home: Scaffold(
        drawer: CustomDrawer(userName: "Maria Silva", userImage: ''),
        appBar: CustomAppBar(),
        body: CustomBottomNavigation(),
      ),
    );
  }
}
