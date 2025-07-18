import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifiers/language_notifier.dart';

class LanguageToggleIconButton extends StatelessWidget {
  const LanguageToggleIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    final currentLocale = languageNotifier.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0), // يمكنك تعديل القيمة حسب الحاجة
      child: IconButton(
        icon: const Icon(Icons.language),
        tooltip: currentLocale == 'en' ? 'Change Language' : 'تغيير اللغة',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text(
                      'English',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      languageNotifier.setLanguage(const Locale('en'));
                      Navigator.of(context).pop();
                    },
                    trailing: currentLocale == 'en'
                        ? Icon(Icons.check, color: colorScheme.primary)
                        : null,
                  ),
                  ListTile(
                    title: const Text(
                      'العربية',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      languageNotifier.setLanguage(const Locale('ar'));
                      Navigator.of(context).pop();
                    },
                    trailing: currentLocale == 'ar'
                        ? Icon(Icons.check, color: colorScheme.primary)
                        : null,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
