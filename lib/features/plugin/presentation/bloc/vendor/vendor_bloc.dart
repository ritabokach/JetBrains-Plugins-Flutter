import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/common/network/load_exception.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/vendor/vendor_event.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/vendor/vendor_state.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorBloc(this._repository) : super(const VendorLoading()) {
    on<VendorOpened>(_onLoadRequested);
    on<VendorRetried>(_onLoadRequested);
  }

  final IPluginRepository _repository;

  Future<void> _onLoadRequested(
    VendorEvent event,
    Emitter<VendorState> emit,
  ) async {
    emit(const VendorLoading());
    try {
      final vendor = await _repository.getVendor(event.slug);
      if (vendor == null) {
        emit(VendorNotFound(event.slug));
        return;
      }
      final plugins = await _repository.getPluginsByVendor(event.slug);
      emit(VendorLoaded(vendor, plugins: plugins));
    } on LoadException catch (error) {
      emit(VendorFailure(event.slug, error));
    }
  }
}
