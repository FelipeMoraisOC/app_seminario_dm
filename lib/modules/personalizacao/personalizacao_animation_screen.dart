import 'package:flutter/material.dart';

class PersonalizacaoAnimationScreen extends StatelessWidget {
  const PersonalizacaoAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animação')),
      body: Center(
        child: Text(
          " Olá Animação 🎥!",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
