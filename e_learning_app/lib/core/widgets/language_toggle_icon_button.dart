import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifiers/language_notifier.dart';

class LanguageToggleIconButton extends StatelessWidget {
  const LanguageToggleIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    final isEnglish = languageNotifier.locale.languageCode == 'en';

    return IconButton(
      icon: Icon(isEnglish ? Icons.language : Icons.translate),
      tooltip: isEnglish ? 'العربية' : 'English',
      onPressed: () {
        languageNotifier.toggleLocale();
      },
    );
  }
}
