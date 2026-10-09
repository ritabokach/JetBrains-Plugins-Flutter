import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context).appTitle)),
        ),
      ),
    );
  }
}
