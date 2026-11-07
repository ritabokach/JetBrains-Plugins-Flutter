sealed class PluginDetailEvent {
  const PluginDetailEvent(this.id);

  final int id;
}

final class PluginDetailOpened extends PluginDetailEvent {
  const PluginDetailOpened(super.id);
}

final class PluginDetailRetried extends PluginDetailEvent {
  const PluginDetailRetried(super.id);
}
