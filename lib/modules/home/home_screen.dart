import 'package:app_seminario/model/curso.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Curso> cursos;

  const HomeScreen({super.key, required this.cursos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // GridView com altura fixa
          SizedBox(
            height: 300,
            width: double.infinity,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5,
              physics:
                  const NeverScrollableScrollPhysics(), // evita conflito de scroll
              children: [
                GridTile(
                  child: Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Center(
                      child: Text(
                        'Total de Cursos:\n${cursos.length}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
                const Card(child: SizedBox()), // Card vazio
                const Card(child: SizedBox()), // Card vazio
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Lista de Cursos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          // Lista de cursos
          Expanded(
            child: ListView.builder(
              itemCount: cursos.length,
              itemBuilder: (context, index) {
                final curso = cursos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(curso.nome),
                    subtitle: Text(curso.descricao),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
