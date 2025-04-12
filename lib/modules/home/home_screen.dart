import 'package:app_seminario/model/curso.dart';
import 'package:app_seminario/modules/curso/curso_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Curso> cursos;
  final String userName = 'Maria Silva';

  const HomeScreen({super.key, required this.cursos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem vindo(a), $userName!')),
      body:
          cursos.isEmpty
              ? Center(
                child: Text(
                  'Nenhum curso adicionado ainda. 📚',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
              : ListView.builder(
                itemCount: cursos.length,
                itemBuilder: (context, index) {
                  final curso = cursos[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: CursoCard(curso: curso),
                  );
                },
              ),
    );
  }
}
