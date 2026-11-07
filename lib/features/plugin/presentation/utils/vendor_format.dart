import 'package:jetbrains_plugins/features/plugin/domain/vendor_model.dart';

extension VendorFormat on VendorModel {
  String? get siteHost {
    final host = Uri.tryParse(url.trim())?.host ?? '';
    if (host.isEmpty) return null;
    return host.startsWith('www.') ? host.substring(4) : host;
  }
}
