import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController textController = TextEditingController();

  void onSalvar() {
    formKey.currentState!.save();
  }

  //... widget do formulário
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: textController,
            decoration: InputDecoration(labelText: 'Campo de Texto'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'insira algum texto';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Realiza alguma ação
              }
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
