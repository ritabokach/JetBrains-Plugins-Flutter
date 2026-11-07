final class VendorModel {
  const VendorModel({
    this.slug,
    required this.name,
    required this.url,
    required this.country,
    required this.isVerified,
  });

  /// Ключ вендора в адресе его страницы. В плагинах из списка его нет:
  /// сервер присылает там только имя.
  final String? slug;
  final String name;
  final String url;
  final String? country;
  final bool isVerified;
}
