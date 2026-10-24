final class VendorModel {
  const VendorModel({
    required this.id,
    required this.name,
    required this.url,
    required this.country,
    required this.isVerified,
  });

  final int id;
  final String name;
  final String url;
  final String? country;
  final bool isVerified;
}
