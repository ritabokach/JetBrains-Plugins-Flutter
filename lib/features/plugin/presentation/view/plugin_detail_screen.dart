import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jetbrains_plugins/common/navigation/app_router.dart';
import 'package:jetbrains_plugins/common/widgets/app_scaffold.dart';
import 'package:jetbrains_plugins/common/widgets/content_width.dart';
import 'package:jetbrains_plugins/common/widgets/message_view.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/detail/plugin_detail_bloc.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/detail/plugin_detail_event.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/detail/plugin_detail_state.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/utils/plugin_format.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/card_surface.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/fact_row.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/plugin_avatar.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/pricing_chip.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/section.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/tag_row.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class PluginDetailScreen extends StatelessWidget {
  const PluginDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PluginDetailBloc(context.read<IPluginRepository>())
            ..add(PluginDetailOpened(id)),
      child: AppScaffold(
        body: BlocBuilder<PluginDetailBloc, PluginDetailState>(
          builder: (context, state) => switch (state) {
            PluginDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            PluginDetailNotFound(:final id) => MessageView(
              text: AppLocalizations.of(context).pluginNotFound(id),
            ),
            PluginDetailLoaded(:final plugin) => _DetailContent(plugin: plugin),
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({required this.plugin});

  final PluginModel plugin;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final links = plugin.links(l10n);
    return ContentWidth(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              children: [
                PluginAvatar(plugin: plugin, size: 56),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(plugin.name, style: theme.textTheme.headlineSmall),
                      Text(
                        plugin.vendor.name,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                PricingChip(pricing: plugin.pricing),
              ],
            ),
            Text(plugin.preview, style: theme.textTheme.bodyMedium),
            Column(
              spacing: 6,
              children: [
                FactRow(label: l10n.detailXmlId, value: plugin.xmlId),
                FactRow(
                  label: l10n.detailDownloads,
                  value: plugin.downloadsLabel,
                ),
                FactRow(
                  label: l10n.detailRating,
                  value: plugin.ratingLabel ?? l10n.detailRatingNone,
                ),
              ],
            ),
            if (plugin.tags.isNotEmpty)
              Section(
                title: l10n.detailTags,
                child: TagRow(tags: plugin.tags),
              ),
            Section(
              title: l10n.detailVendor,
              child: _VendorLink(plugin: plugin),
            ),
            if (links.isNotEmpty)
              Section(
                title: l10n.detailLinks,
                child: Column(
                  spacing: 6,
                  children: [
                    for (final (label, url) in links)
                      FactRow(label: label, value: url),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _VendorLink extends StatelessWidget {
  const _VendorLink({required this.plugin});

  final PluginModel plugin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardSurface(
      onTap: () => context.push(AppRoutes.vendor(plugin.vendor.id)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plugin.vendor.name, style: theme.textTheme.titleSmall),
                Text(
                  AppLocalizations.of(context).detailOpenVendor,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}
