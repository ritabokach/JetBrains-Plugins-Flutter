import 'package:jetbrains_plugins/common/network/load_exception.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';

sealed class PluginListState {
  const PluginListState({required this.query});

  final String query;
}

final class PluginListLoading extends PluginListState {
  const PluginListLoading({super.query = ''});
}

final class PluginListLoaded extends PluginListState {
  const PluginListLoaded({
    required super.query,
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  final List<PluginModel> items;

  /// На сервере есть ещё страницы.
  final bool hasMore;

  /// Догружается следующая страница: внизу списка индикатор.
  final bool isLoadingMore;

  /// Следующая страница не загрузилась. Загруженное остаётся на экране,
  /// внизу кнопка «Повторить».
  final LoadException? loadMoreError;

  bool get isNothingFound => items.isEmpty && query.trim().isNotEmpty;

  bool get isCatalogEmpty => items.isEmpty && query.trim().isEmpty;
}

final class PluginListFailure extends PluginListState {
  const PluginListFailure({required super.query, required this.error});

  final LoadException error;
}
