import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/common/network/load_exception.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/list/plugin_list_state.dart';

class PluginListCubit extends Cubit<PluginListState> {
  PluginListCubit(this._repository) : super(const PluginListLoading());

  final IPluginRepository _repository;

  static const int _pageSize = 20;

  Future<void> load() => search(state.query);

  Future<void> search(String query) async {
    emit(PluginListLoading(query: query));
    final result = await _fetch(query);
    if (isClosed || state.query != query) return;
    emit(result);
  }

  /// Экран вызывает метод, когда список докручен почти до конца, и может
  /// вызвать его несколько раз подряд. Лишние вызовы отсекаются здесь.
  Future<void> loadMore() async {
    final current = state;
    if (current is! PluginListLoaded ||
        !current.hasMore ||
        current.isLoadingMore) {
      return;
    }
    final loading = PluginListLoaded(
      query: current.query,
      items: current.items,
      hasMore: true,
      isLoadingMore: true,
    );
    emit(loading);
    try {
      // Смещение считаем по тому, что уже показано.
      final next = await _page(current.query, offset: current.items.length);
      // Пока ждали, могли начать новый поиск: тогда ответ уже не нужен.
      if (isClosed || state != loading) return;
      // Между запросами порядок на сервере может сдвинуться, тогда запись с
      // прошлой страницы придёт ещё раз. Повторы отбрасываем.
      final shown = {for (final plugin in current.items) plugin.id};
      emit(
        PluginListLoaded(
          query: current.query,
          items: [
            ...current.items,
            ...next.where((plugin) => !shown.contains(plugin.id)),
          ],
          hasMore: next.length == _pageSize,
        ),
      );
    } on LoadException catch (error) {
      if (isClosed || state != loading) return;
      emit(
        PluginListLoaded(
          query: current.query,
          items: current.items,
          hasMore: true,
          loadMoreError: error,
        ),
      );
    }
  }

  Future<PluginListState> _fetch(String query) async {
    try {
      final items = await _page(query, offset: 0);
      return PluginListLoaded(
        query: query,
        items: items,
        hasMore: items.length == _pageSize,
      );
    } on LoadException catch (error) {
      return PluginListFailure(query: query, error: error);
    }
  }

  Future<List<PluginModel>> _page(String query, {required int offset}) {
    final needle = query.trim();
    return needle.isEmpty
        ? _repository.getPlugins(offset: offset, limit: _pageSize)
        : _repository.searchPlugins(needle, offset: offset, limit: _pageSize);
  }
}
