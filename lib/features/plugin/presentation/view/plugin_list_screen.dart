import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jetbrains_plugins/common/navigation/app_router.dart';
import 'package:jetbrains_plugins/common/widgets/app_scaffold.dart';
import 'package:jetbrains_plugins/common/widgets/content_width.dart';
import 'package:jetbrains_plugins/common/widgets/load_error_view.dart';
import 'package:jetbrains_plugins/common/widgets/message_view.dart';
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
    final l10n = AppLocalizations.of(context);
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
                builder: (context, state) => switch (state) {
                  PluginListLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  PluginListFailure(:final error) => LoadErrorView(
                    error: error,
                    onRetry: cubit.load,
                  ),
                  PluginListLoaded(isCatalogEmpty: true) => MessageView(
                    text: l10n.listEmpty,
                  ),
                  PluginListLoaded(isNothingFound: true, :final query) =>
                    MessageView(text: l10n.searchEmpty(query.trim())),
                  PluginListLoaded() => _PluginList(state: state),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Список с подгрузкой страниц. Состояние нужно ради ScrollController: по
/// нему видно, что список докручен почти до конца.
class _PluginList extends StatefulWidget {
  const _PluginList({required this.state});

  final PluginListLoaded state;

  @override
  State<_PluginList> createState() => _PluginListState();
}

class _PluginListState extends State<_PluginList> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// До конца осталось меньше пары карточек: просим следующую страницу.
  /// Вызовов будет много, лишние отсекает Cubit.
  void _onScroll() {
    if (_controller.position.extentAfter < 300) {
      context.read<PluginListCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final items = state.items;
    final showFooter = state.isLoadingMore || state.loadMoreError != null;
    return ListView.separated(
      controller: _controller,
      padding: const EdgeInsets.all(16),
      itemCount: items.length + (showFooter ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == items.length) return _Footer(state: state);
        final plugin = items[index];
        return PluginCard(
          plugin: plugin,
          onTap: () => context.push(AppRoutes.plugin(plugin.id)),
        );
      },
    );
  }
}

/// Под списком: индикатор догрузки или ошибка с «Повторить».
class _Footer extends StatelessWidget {
  const _Footer({required this.state});

  final PluginListLoaded state;

  @override
  Widget build(BuildContext context) {
    final error = state.loadMoreError;
    return error == null
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          )
        : LoadErrorView(
            error: error,
            onRetry: context.read<PluginListCubit>().loadMore,
          );
  }
}
