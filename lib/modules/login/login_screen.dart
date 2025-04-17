import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    cpfController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final cpf = cpfController.text;
      final email = emailController.text;

      // Mock do login
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('CPF: $cpf\nEmail: $email')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cpfController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _CpfInputFormatter(),
                ],
                decoration: const InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if (value == null || value.isEmpty) return '* digite o CPF';
                  if (!_validarCpf(value)) return '* CPF inválido';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* digite o e-mail';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return '* e-mail inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validarCpf(String cpf) {
    final numbers = cpf.replaceAll(RegExp(r'\D'), '');
    if (numbers.length != 11) return false;
    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) return false;

    int calcDig(int n) {
      int sum = 0;
      for (int i = 0; i < n; i++) {
        sum += int.parse(numbers[i]) * (n + 1 - i);
      }
      int mod = (sum * 10) % 11;
      return mod == 10 ? 0 : mod;
    }

    int dig1 = calcDig(9);
    int dig2 = calcDig(10);

    return dig1 == int.parse(numbers[9]) && dig2 == int.parse(numbers[10]);
  }
}

class _CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length > 11) text = text.substring(0, 11);

    String newText = '';
    for (int i = 0; i < text.length; i++) {
      if (i == 3 || i == 6) newText += '.';
      if (i == 9) newText += '-';
      newText += text[i];
    }

    return TextEditingValue(text: newText);
  }
}
