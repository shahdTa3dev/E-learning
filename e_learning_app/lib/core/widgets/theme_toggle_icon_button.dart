import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifiers/theme_notifier.dart';

class ThemeToggleIconButton extends StatelessWidget {
  const ThemeToggleIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDark = themeNotifier.isDark;
    final colorScheme = Theme.of(context).colorScheme;

    return Tooltip(
      message: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      child: InkWell(
        onTap: themeNotifier.toggleTheme,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primary.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            isDark ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
