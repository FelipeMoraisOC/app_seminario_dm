import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userImage;

  const CustomDrawer({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Top Section with User Info
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  backgroundImage: NetworkImage(userImage),
                  child:
                      userImage.isEmpty
                          ? const Icon(Icons.person, size: 40)
                          : null,
                ),
                const SizedBox(height: 10),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // List Section
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 8),
                    child: Text(
                      'Rotas nomeadas: ',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: const Divider(thickness: 1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text('Meu Perfil'),
                    subtitle: Text(
                      '/meu-perfil',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/meu-perfil');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Configurações'),
                    subtitle: Text(
                      '/configuracoes',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/configuracoes');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.color_lens_outlined),
                    title: Text(
                      'Personalização',
                      style: GoogleFonts.underdog(fontSize: 18),
                    ),
                    subtitle: Text(
                      '/personalizacao',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/personalizacao');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 8),
                    child: Text(
                      'Exemplos: ',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: const Divider(thickness: 1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.grid_on_outlined),
                    title: Text('GridView.Builder'),
                    subtitle: Text(
                      '/gridview-builder',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/gridview-builder');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.view_comfy_alt_outlined),
                    title: Text('GridView.Extend'),
                    subtitle: Text(
                      '/gridview-extend',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/gridview-extend');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
