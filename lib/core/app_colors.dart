import 'package:flutter/material.dart';

class AppColors {
  // Cores principais (verde claro e moderno)
  static const Color primary = Color.fromARGB(
    255,
    30,
    63,
    52,
  ); // Verde padrão Material Design
  static const Color secondary = Color(0xFFC8E6C9); // Verde muito claro (fundo)
  static const Color accent = Color(0xFF81C784); // Verde suave para realce

  // Cores de fundo
  static const Color backgroundLight = Color.fromARGB(
    255,
    199,
    212,
    203,
  ); // Quase branco com tom esverdeado
  static const Color backgroundDark = Color(0xFF212121); // Preto acinzentado

  // Cores de texto
  static const Color textLight = Color(
    0xFF1B1B1B,
  ); // Preto quase puro Preto quase puro
  static const Color textDark = Color(
    0xFFE0E0E0,
  ); // Cinza claro para contraste no dark

  // Cores de erro e sucesso
  static const Color error = Color(0xFFE57373); // Vermelho suave
  static const Color success = Color(0xFF388E3C); // Verde escuro padrão

  // Botões e elementos interativos
  static const Color buttonLight = primary; // Verde médio e limpo
  static const Color buttonDark =
      primary; // Verde escuro para contraste no dark

  // Sombra e bordas
  static const Color shadow = Color(0x33000000); // Sombra sutil
  static const Color border = Color(0xFF4CAF50); // Igual ao primary

  static const Color cardDark = Color(0xFF303030);
  static const Color cardLight = Color(0xFFF0FDF4);
}
