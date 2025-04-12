import 'package:app_seminario/core/app_colors.dart';
import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          // Top Section with User Info
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(userImage),
                  child:
                      userImage.isEmpty
                          ? const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          )
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
              color: theme.scaffoldBackgroundColor,
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configurações'),
                    onTap: () {
                      // Handle Configurações tap
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Meu Perfil'),
                    onTap: () {
                      // Handle Meu Perfil tap
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
