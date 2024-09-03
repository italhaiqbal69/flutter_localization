import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onChangeLanguage});

  final void Function(Locale locale) onChangeLanguage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.welcome),
        actions: [
          // Language Switcher
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<Locale>(
              value: Localizations.localeOf(context),
              icon: const Icon(Icons.language, color: Colors.white),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  widget.onChangeLanguage(newLocale);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('ur'),
                  child: Text('اردو'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
          child: Text(
        AppLocalizations.of(context)!.talhaIqbal,
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
      )),
    );
  }
}
