sealed class VendorEvent {
  const VendorEvent(this.slug);

  final String slug;
}

final class VendorOpened extends VendorEvent {
  const VendorOpened(super.slug);
}

final class VendorRetried extends VendorEvent {
  const VendorRetried(super.slug);
}
