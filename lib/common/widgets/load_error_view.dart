import 'package:flutter/material.dart';
import 'package:jetbrains_plugins/common/network/load_exception.dart';
import 'package:jetbrains_plugins/common/widgets/message_view.dart';
import 'package:jetbrains_plugins/l10n/app_localizations.dart';

/// Сообщение об ошибке загрузки и кнопка «Повторить».
///
/// Пользователь видит понятную фразу, а не `DioException [...]`.
class LoadErrorView extends StatelessWidget {
  const LoadErrorView({super.key, required this.error, required this.onRetry});

  final LoadException error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final message = switch (error) {
      NoConnectionException() => l10n.errorNoConnection,
      TimeoutLoadException() => l10n.errorTimeout,
      // Деталь и вендор превращают 404 в «записи нет» раньше. Сюда 404
      // доходит, только если неверен сам адрес сервера.
      NotFoundException() => l10n.errorServer('404'),
      ServerException(:final statusCode) => l10n.errorServer(
        statusCode?.toString() ?? '?',
      ),
      BadResponseException() => l10n.errorBadResponse,
    };
    return MessageView(
      text: message,
      action: FilledButton.tonal(
        onPressed: onRetry,
        child: Text(l10n.actionRetry),
      ),
    );
  }
}
