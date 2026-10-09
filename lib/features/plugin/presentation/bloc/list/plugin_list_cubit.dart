import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/list/plugin_list_state.dart';

class PluginListCubit extends Cubit<PluginListState> {
  PluginListCubit(this._repository) : super(const PluginListState());

  final IPluginRepository _repository;

  Future<void> load() => search(state.query);

  Future<void> search(String query) async {
    emit(state.copyWith(query: query));
    final needle = query.trim();
    final items = needle.isEmpty
        ? await _repository.getPlugins()
        : await _repository.searchPlugins(needle);
    if (isClosed || state.query != query) return;
    emit(state.copyWith(items: items));
  }
}
