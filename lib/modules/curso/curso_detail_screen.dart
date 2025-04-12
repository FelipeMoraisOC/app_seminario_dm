import 'package:app_seminario/model/curso.dart';
import 'package:flutter/material.dart';

class CursoDetailScreen extends StatelessWidget {
  final Curso curso;

  const CursoDetailScreen({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(curso.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(curso.nome, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(curso.descricao, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
