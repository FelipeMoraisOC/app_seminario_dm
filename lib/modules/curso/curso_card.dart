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
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              // Imagem ocupa 1/3
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    curso.imagem, // substitua pelo caminho correto
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              // Texto ocupa 2/3
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        curso.nome,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Alunos: ${curso.quantidadeAlunos}'),
                      Text('Início: ${_formatarData(curso.dataInicio)}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }
}
