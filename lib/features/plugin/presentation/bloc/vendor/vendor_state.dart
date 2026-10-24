import 'package:jetbrains_plugins/features/plugin/domain/plugin_model.dart';
import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

sealed class VendorState {
  const VendorState();
}

final class VendorLoading extends VendorState {
  const VendorLoading();
}

final class VendorLoaded extends VendorState {
  const VendorLoaded(this.vendor, {required this.plugins});

  final VendorModel vendor;
  final List<PluginModel> plugins;
}

final class VendorNotFound extends VendorState {
  const VendorNotFound(this.id);

  final int id;
}
