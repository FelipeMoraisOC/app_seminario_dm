import 'package:app_seminario/model/curso.dart';
import 'package:app_seminario/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final dataInicioController = TextEditingController();
  final quantidadeAlunosController = TextEditingController();

  DateTime? _dataInicioReal;

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final novoCurso = Curso(
        nome: nomeController.text.trim(),
        descricao: descricaoController.text.trim(),
        email: emailController.text.trim(),
        senha: senhaController.text.trim(),
        quantidadeAlunos: int.parse(quantidadeAlunosController.text.trim()),
        dataInicio: _dataInicioReal!,
      );
      widget.onSalvar(novoCurso);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar novo curso')),
      body: SingleChildScrollView(
        child: Padding(
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
                              ? '* Digite um nome'
                              : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: null,
                  controller: descricaoController,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? '* Digite uma descrição para o curso'
                              : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: quantidadeAlunosController,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade de Alunos:',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? '* Informe a quantidade de alunos'
                              : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: senhaController,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* Digite uma senha';
                    } else if (value.length < 6) {
                      return '* Senha muito curta';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confirme a senha',
                  ),
                  obscureText: true,
                  validator:
                      (value) =>
                          value != senhaController.text
                              ? '* As senhas não coincidem'
                              : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: dataInicioController,
                  decoration: const InputDecoration(
                    labelText: 'Data de Início',
                    hintText: 'dd/mm/aaaa',
                  ),
                  readOnly: true,
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dataInicioReal = pickedDate;
                        dataInicioController.text = DateFormat(
                          'dd/MM/yyyy',
                        ).format(pickedDate);
                      });
                    }
                  },
                  validator:
                      (value) =>
                          _dataInicioReal == null
                              ? '* Selecione uma data'
                              : null,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onPressed: _salvar,
                    label: 'Salvar',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
