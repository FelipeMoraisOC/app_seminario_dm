import 'package:app_seminario/core/theme_provider.dart';
import 'package:flutter/material.dart';

class MeuPerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/avatar_placeholder.png'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Maria Silva',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCard(context, Icons.school, 'Meus Cursos'),
                  _buildCard(context, Icons.people, 'Colegas'),
                  _buildCard(context, Icons.card_membership, 'Certificados'),
                  _buildCard(context, Icons.event, 'Eventos'),
                  _buildCard(context, Icons.work, 'Estágios'),
                  _buildCard(context, Icons.book, 'Biblioteca'),
                  _buildCard(context, Icons.settings, 'Configurações'),
                  _buildCard(context, Icons.help, 'Ajuda'),
                  _buildCard(context, Icons.notifications, 'Notificações'),
                  _buildCard(context, Icons.star, 'Favoritos'),
                  _buildCard(context, Icons.history, 'Histórico'),
                  _buildCard(context, Icons.feedback, 'Feedback'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard( BuildContext context, icon, String label) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}