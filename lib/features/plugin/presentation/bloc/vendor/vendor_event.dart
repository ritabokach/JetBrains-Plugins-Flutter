sealed class VendorEvent {
  const VendorEvent();
}

final class VendorOpened extends VendorEvent {
  const VendorOpened(this.id);

  final int id;
}
