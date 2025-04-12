import 'package:app_seminario/model/curso.dart';
import 'package:flutter/material.dart';

class AdicionarCurso extends StatefulWidget {
  final Function(Curso) onSalvar;

  const AdicionarCurso({super.key, required this.onSalvar});

  @override
  State<AdicionarCurso> createState() => _AdicionarCursoState();
}

class _AdicionarCursoState extends State<AdicionarCurso> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final novoCurso = Curso(
        nome: nomeController.text.trim(),
        descricao: descricaoController.text.trim(),
      );
      widget.onSalvar(novoCurso);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Curso')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome do curso'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Digite um nome'
                            : null,
              ),
              TextFormField(
                controller: descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator:
                    (value) =>
                        value != null && value.length < 5
                            ? 'Descrição muito curta'
                            : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _salvar, child: const Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
