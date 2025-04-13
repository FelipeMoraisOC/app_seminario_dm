import 'package:app_seminario/core/app_colors.dart';
import 'package:app_seminario/core/theme_provider.dart';
import 'package:app_seminario/modules/personalizacao/personalizacao_animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalizacaoScreen extends StatefulWidget {
  const PersonalizacaoScreen({super.key});

  @override
  State<PersonalizacaoScreen> createState() => _PersonalizacaoScreenState();
}

class _PersonalizacaoScreenState extends State<PersonalizacaoScreen> {
  int selectedCorIndex = 0;
  int selectedFonteIndex = 0;

  final List<Color> coresDisponiveis = [
    AppColors.primary,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  final List<String> fontesDisponiveis = [
    'Inter',
    'Roboto',
    'Manrope',
    'Poppins',
    'Underdog',
  ];

  void _aplicarCor(BuildContext context, Color cor) {
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).setCustomPrimaryColor(cor);
  }

  void _aplicarFonte(BuildContext context, String fonte) {
    Provider.of<ThemeProvider>(context, listen: false).setCustomFont(fonte);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personalização')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha a cor principal:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(coresDisponiveis.length, (index) {
                return CheckboxListTile(
                  title: Row(
                    children: [
                      Text('Cor:'),
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: coresDisponiveis[index],
                          border: Border.all(
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  value: selectedCorIndex == index,
                  activeColor: coresDisponiveis[index],
                  onChanged: (_) {
                    setState(() {
                      selectedCorIndex = index;
                      _aplicarCor(context, coresDisponiveis[index]);
                    });
                  },
                );
              }),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Escolha a fonte:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(fontesDisponiveis.length, (index) {
                return CheckboxListTile(
                  title: Text(
                    fontesDisponiveis[index],
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontFamily:
                          GoogleFonts.getFont(
                            fontesDisponiveis[index],
                          ).fontFamily,
                    ),
                  ),
                  value: selectedFonteIndex == index,
                  onChanged: (_) {
                    setState(() {
                      selectedFonteIndex = index;
                      _aplicarFonte(context, fontesDisponiveis[index]);
                    });
                  },
                );
              }),
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Animações de Navegação:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.3,
              ),
              children: [
                //ANIMACAO PADRAO
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PersonalizacaoAnimationScreen(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        'Animação padrão MaterialPageRoute',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                //ANIMACAO FADE
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder:
                            (_, anim, __) => PersonalizacaoAnimationScreen(),
                        transitionsBuilder:
                            (_, anim, __, child) =>
                                FadeTransition(opacity: anim, child: child),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text('Animação Fade', textAlign: TextAlign.center),
                    ),
                  ),
                ),
                //ANIMACAO SLIDE
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder:
                            (_, anim, __) => PersonalizacaoAnimationScreen(),
                        transitionsBuilder:
                            (_, anim, __, child) => SlideTransition(
                              position: Tween(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).animate(anim),
                              child: child,
                            ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        'Animação Slide',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                //ANIMACAO ZOOM IN
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder:
                            (_, anim, __) => PersonalizacaoAnimationScreen(),
                        transitionsBuilder: (_, anim, __, child) {
                          final zoom = Tween<double>(
                            begin: 0.8,
                            end: 1.0,
                          ).animate(anim);
                          return ScaleTransition(scale: zoom, child: child);
                        },
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        'Animação Zoom In',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                //De baixo para cima
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder:
                            (_, anim, __) => PersonalizacaoAnimationScreen(),
                        transitionsBuilder: (_, anim, __, child) {
                          final offset = Tween<Offset>(
                            begin: const Offset(0.0, 1.0),
                            end: Offset.zero,
                          ).animate(anim);
                          return SlideTransition(
                            position: offset,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        'Animação de baixo para cima',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                //Rotação + fade
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder:
                            (_, anim, __) => PersonalizacaoAnimationScreen(),
                        transitionsBuilder: (_, anim, __, child) {
                          final rotation = Tween<double>(
                            begin: -0.1,
                            end: 0.0,
                          ).animate(anim);
                          final fade = Tween<double>(
                            begin: 0.0,
                            end: 1.0,
                          ).animate(anim);
                          return RotationTransition(
                            turns: rotation,
                            child: FadeTransition(opacity: fade, child: child),
                          );
                        },
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Center(
                      child: Text(
                        'Animação de rotação + fade',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
