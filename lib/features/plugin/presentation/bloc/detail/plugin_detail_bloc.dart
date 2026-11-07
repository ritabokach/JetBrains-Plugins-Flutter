import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/common/network/load_exception.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/detail/plugin_detail_event.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/detail/plugin_detail_state.dart';

class PluginDetailBloc extends Bloc<PluginDetailEvent, PluginDetailState> {
  PluginDetailBloc(this._repository) : super(const PluginDetailLoading()) {
    on<PluginDetailOpened>(_onLoadRequested);
    on<PluginDetailRetried>(_onLoadRequested);
  }

  final IPluginRepository _repository;

  /// Если экран закрыли до ответа, Bloc отменяет обработчик, и emit после
  /// await ничего не делает. Проверять isClosed, как в Cubit, не нужно.
  Future<void> _onLoadRequested(
    PluginDetailEvent event,
    Emitter<PluginDetailState> emit,
  ) async {
    emit(const PluginDetailLoading());
    try {
      final plugin = await _repository.getPlugin(event.id);
      emit(
        plugin == null
            ? PluginDetailNotFound(event.id)
            : PluginDetailLoaded(plugin),
      );
    } on LoadException catch (error) {
      emit(PluginDetailFailure(event.id, error));
    }
  }
}
