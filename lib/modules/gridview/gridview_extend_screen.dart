import 'package:flutter/material.dart';

class GridviewExtentScreen extends StatelessWidget {
  const GridviewExtentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista com caminhos de imagens locais (use assets reais no seu projeto)
    String pathImgGrande = 'assets/images/img_grande.png';
    String pathImgMedia = 'assets/images/img_media.jpg';
    String pathImgPequena = 'assets/images/img_pequena.png';
    final List<Map<String, dynamic>> imagens = [
      {'path': pathImgGrande, 'altura': 300.0},
      {'path': pathImgMedia, 'altura': 150.0},
      {'path': pathImgPequena, 'altura': 100.0},
      {'path': pathImgGrande, 'altura': 200.0},
      {'path': pathImgMedia, 'altura': 150.0},
      {'path': pathImgPequena, 'altura': 100.0},
      {'path': pathImgGrande, 'altura': 200.0},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('GridView.extent - Responsivo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.extent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children:
              imagens.map((imagem) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagem['path'],
                      height: imagem['altura'],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
