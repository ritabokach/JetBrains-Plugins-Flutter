import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/app.dart';

const String _locale = String.fromEnvironment('LOCALE');

void main() {
  runApp(App(locale: _locale.isEmpty ? null : Locale(_locale)));
}
