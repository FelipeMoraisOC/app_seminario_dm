import 'package:app_seminario/model/curso.dart';
import 'package:app_seminario/modules/curso/adicionar_curso.dart';
import 'package:app_seminario/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _indexAtual = 0;
  final List<Curso> _cursos = [
    Curso(
      nome: 'Curso FLutter',
      descricao: 'Aprenda Flutter do zero!',
      dataInicio: DateTime.now(),
      email: 'flutter@email.com',
      senha: 'utfpr',
      imagem: 'assets/images/flutter.png',
      quantidadeAlunos: 40,
    ),
    Curso(
      nome: 'Curso Dart',
      descricao: 'Aprenda Dart do zero!',
      dataInicio: DateTime.now(),
      email: 'dart@email.com',
      senha: 'utfpr',
      imagem: 'assets/images/dart.png',
      quantidadeAlunos: 30,
    ),
  ];

  void _adicionarCurso(Curso curso) {
    setState(() {
      _cursos.add(curso);
      _indexAtual = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final telas = [
      HomeScreen(cursos: _cursos),
      AdicionarCurso(onSalvar: _adicionarCurso),
    ];

    return Scaffold(
      body: telas[_indexAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAtual,
        onTap: (index) => setState(() => _indexAtual = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_outlined),
            label: 'Adicionar',
          ),
        ],
      ),
    );
  }
}
