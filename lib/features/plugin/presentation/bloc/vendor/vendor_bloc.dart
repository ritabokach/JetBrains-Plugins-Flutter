import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jetbrains_plugins/features/plugin/domain/i_plugin_repository.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/vendor/vendor_event.dart';
import 'package:jetbrains_plugins/features/plugin/presentation/bloc/vendor/vendor_state.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorBloc(this._repository) : super(const VendorLoading()) {
    on<VendorOpened>(_onOpened);
  }

  final IPluginRepository _repository;

  Future<void> _onOpened(VendorOpened event, Emitter<VendorState> emit) async {
    final vendor = await _repository.getVendor(event.id);
    if (vendor == null) {
      emit(VendorNotFound(event.id));
      return;
    }
    final plugins = await _repository.getPluginsByVendor(vendor.id);
    emit(VendorLoaded(vendor, plugins: plugins));
  }
}
