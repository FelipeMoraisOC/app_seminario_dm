import 'package:flutter/material.dart';

class AppColors {
  // Cores principais
  static const Color primary = Color(0xFF2E7D32); // Verde principal
  static const Color secondary = Color(
    0xFF66BB6A,
  ); // Verde mais claro para contraste
  static const Color accent = Color(0xFF81C784); // Realce mais suave

  // Cores de fundo
  static const Color backgroundLight = Color(0xFFF1F8E9); // Verde esbranquiçado
  static const Color backgroundDark = Color(0xFF121212); // Preto Material

  // Cores de texto
  static const Color textLight = Color(0xFF1B1B1B); // Quase preto
  static const Color textDark = Color(0xFFF5F5F5); // Quase branco

  // Cores de erro e sucesso
  static const Color error = Color(0xFFEF5350); // Vermelho mais suave
  static const Color success = Color(0xFF388E3C); // Verde escuro Material

  // Botões e elementos interativos
  static const Color buttonLight = Color(0xFF43A047); // Verde médio
  static const Color buttonDark = Color(0xFF1B5E20); // Verde escuro

  // Sombra e bordas
  static const Color shadow = Color(0x33000000); // Sombra genérica
  static const Color border = Color(0xFF66BB6A); // Igual ao secondary
}
