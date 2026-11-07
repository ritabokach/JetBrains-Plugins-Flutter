import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/list/plugin_list_state.dart';

class PluginListCubit extends Cubit<PluginListState> {
  PluginListCubit(this._repository) : super(const PluginListLoading());

  final IPluginRepository _repository;

  Future<void> load() => search(state.query);

  Future<void> search(String query) async {
    emit(PluginListLoading(query: query));
    final result = await _fetch(query);
    if (isClosed || state.query != query) return;
    emit(result);
  }

  Future<PluginListState> _fetch(String query) async {
    final needle = query.trim();
    try {
      final items = needle.isEmpty
          ? await _repository.getPlugins()
          : await _repository.searchPlugins(needle);
      return PluginListLoaded(query: query, items: items);
    } catch (_) {
      return PluginListFailure(query: query);
    }
  }
}
