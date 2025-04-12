import 'package:app_seminario/core/app_colors.dart';
import 'package:app_seminario/core/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return AppBar(
      title: const Text(
        '🎓 Curso App',
        style: TextStyle(color: AppColors.textDark),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Light\nTheme',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 12, color: AppColors.textDark),
            ),
            const SizedBox(width: 8),
            CupertinoSwitch(
              value: isDark,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
              activeTrackColor: AppColors.backgroundLight,
              inactiveTrackColor: AppColors.textLight,
              inactiveThumbColor: AppColors.backgroundLight,
              thumbColor: AppColors.textLight,
            ),
            const SizedBox(width: 8),
            const Text(
              'Dark\nMode',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12, color: AppColors.textLight),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
