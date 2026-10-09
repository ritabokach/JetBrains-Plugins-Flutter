import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/utils/plugin_format.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/card_surface.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/plugin_avatar.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/pricing_chip.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/tag_row.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class PluginCard extends StatelessWidget {
  const PluginCard({super.key, required this.plugin, this.onTap});

  final PluginModel plugin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final secondary = theme.textTheme.labelMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    final rating = plugin.ratingLabel;
    return CardSurface(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PluginAvatar(plugin: plugin),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plugin.name,
                  style: theme.textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  plugin.vendor.name,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Wrap(
                    spacing: 12,
                    children: [
                      Text(
                        l10n.cardDownloads(plugin.downloadsLabel),
                        style: secondary,
                      ),
                      Text(
                        rating == null
                            ? l10n.cardNoRating
                            : l10n.cardRating(rating),
                        style: secondary,
                      ),
                    ],
                  ),
                ),
                if (plugin.tags.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TagRow(tags: plugin.tags),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PricingChip(pricing: plugin.pricing),
        ],
      ),
    );
  }
}
