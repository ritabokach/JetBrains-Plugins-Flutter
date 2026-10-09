import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/common/widgets/app_scaffold.dart';
import 'package:jetbrains_plugins/common/widgets/content_width.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/list/plugin_list_cubit.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/list/plugin_list_state.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/plugin_card.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/view/widgets/search_field.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

class PluginListScreen extends StatelessWidget {
  const PluginListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PluginListCubit>();
    return AppScaffold(
      body: ContentWidth(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SearchField(
                initialQuery: cubit.state.query,
                onChanged: cubit.search,
              ),
            ),
            Expanded(
              child: BlocBuilder<PluginListCubit, PluginListState>(
                builder: (context, state) => state.isNothingFound
                    ? _NothingFound(query: state.query.trim())
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.items.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) =>
                            PluginCard(plugin: state.items[index]),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NothingFound extends StatelessWidget {
  const _NothingFound({required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          AppLocalizations.of(context).searchEmpty(query),
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
