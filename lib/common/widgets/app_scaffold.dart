import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/common/widgets/theme_toggle_button.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
        actions: const [ThemeToggleButton()],
      ),
      body: body,
    );
  }
}
