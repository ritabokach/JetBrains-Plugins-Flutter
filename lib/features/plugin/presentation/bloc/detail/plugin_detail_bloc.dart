import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/detail/plugin_detail_event.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/detail/plugin_detail_state.dart';

class PluginDetailBloc extends Bloc<PluginDetailEvent, PluginDetailState> {
  PluginDetailBloc(this._repository) : super(const PluginDetailLoading()) {
    on<PluginDetailOpened>(_onOpened);
  }

  final IPluginRepository _repository;

  Future<void> _onOpened(
    PluginDetailOpened event,
    Emitter<PluginDetailState> emit,
  ) async {
    final plugin = await _repository.getPlugin(event.id);
    emit(
      plugin == null
          ? PluginDetailNotFound(event.id)
          : PluginDetailLoaded(plugin),
    );
  }
}
