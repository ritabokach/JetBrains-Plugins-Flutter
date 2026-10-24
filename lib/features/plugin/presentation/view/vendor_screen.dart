import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jetbrains_plugins/common/navigation/app_router.dart';
import 'package:jetbrains_plugins/common/widgets/app_scaffold.dart';
import 'package:jetbrains_plugins/common/widgets/content_width.dart';
import 'package:jetbrains_plugins/common/widgets/message_view.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/vendor/vendor_bloc.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/vendor/vendor_event.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/vendor/vendor_state.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/utils/vendor_format.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/fact_row.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/plugin_card.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class VendorScreen extends StatelessWidget {
  const VendorScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VendorBloc(context.read<IPluginRepository>())..add(VendorOpened(id)),
      child: AppScaffold(
        body: BlocBuilder<VendorBloc, VendorState>(
          builder: (context, state) => switch (state) {
            VendorLoading() => const Center(child: CircularProgressIndicator()),
            VendorNotFound(:final id) => MessageView(
              text: AppLocalizations.of(context).vendorNotFound(id),
            ),
            VendorLoaded(:final vendor, :final plugins) => _VendorContent(
              vendor: vendor,
              plugins: plugins,
            ),
          },
        ),
      ),
    );
  }
}

class _VendorContent extends StatelessWidget {
  const _VendorContent({required this.vendor, required this.plugins});

  final VendorModel vendor;
  final List<PluginModel> plugins;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return ContentWidth(
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: plugins.length + 2,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) return _VendorHeader(vendor: vendor);
          if (index == 1) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                l10n.vendorPlugins(plugins.length),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            );
          }
          final plugin = plugins[index - 2];
          return PluginCard(
            plugin: plugin,
            onTap: () => context.push(AppRoutes.plugin(plugin.id)),
          );
        },
      ),
    );
  }
}

class _VendorHeader extends StatelessWidget {
  const _VendorHeader({required this.vendor});

  final VendorModel vendor;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final country = vendor.country;
    final site = vendor.siteHost;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(vendor.name, style: theme.textTheme.headlineSmall),
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            vendor.isVerified ? l10n.vendorVerified : l10n.vendorUnverified,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        if (country != null) FactRow(label: l10n.vendorCountry, value: country),
        if (site != null) FactRow(label: l10n.vendorSite, value: site),
      ],
    );
  }
}
