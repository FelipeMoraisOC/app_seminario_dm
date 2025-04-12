import 'package:app_seminario/model/curso.dart';
import 'package:app_seminario/modules/curso/curso_detail_screen.dart';
import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  final Curso curso;

  const CursoCard({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CursoDetailScreen(curso: curso)),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(curso.nome, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(
                curso.descricao,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
