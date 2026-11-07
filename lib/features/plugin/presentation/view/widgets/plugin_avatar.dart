import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/utils/plugin_format.dart';

class PluginAvatar extends StatelessWidget {
  const PluginAvatar({super.key, required this.plugin, this.size = 44});

  final PluginModel plugin;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            plugin.initial,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
