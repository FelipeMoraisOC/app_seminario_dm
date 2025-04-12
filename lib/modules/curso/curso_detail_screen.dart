import 'package:app_seminario/model/curso.dart';
import 'package:app_seminario/widgets/custom_elevated_button.dart';
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
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagem no topo
              SizedBox(
                height: 180,
                child: Image.asset(
                  curso.imagem, // Troque pelo caminho correto
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      curso.nome,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      curso.descricao,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),

                    // Quantidade de alunos e data lado a lado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Alunos: ${curso.quantidadeAlunos}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Início: ${_formatarData(curso.dataInicio)}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Botões
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                            label: 'Editar',
                            onPressed: () {
                              // Lógica de edição aqui
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                            label: 'Excluir',
                            onPressed: () {
                              // Lógica de exclusão aqui
                            },
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
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
