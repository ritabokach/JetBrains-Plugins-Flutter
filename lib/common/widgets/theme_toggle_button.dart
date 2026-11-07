import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/common/theme/theme_cubit.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      onPressed: context.read<ThemeCubit>().toggle,
      tooltip: AppLocalizations.of(context).actionToggleTheme,
      icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
    );
  }
}
