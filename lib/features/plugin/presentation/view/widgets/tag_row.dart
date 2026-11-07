import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/label_chip.dart';

class TagRow extends StatelessWidget {
  const TagRow({super.key, required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final tag in tags)
          LabelChip(
            text: tag,
            background: colors.surfaceContainerHighest,
            foreground: colors.onSurfaceVariant,
          ),
      ],
    );
  }
}
