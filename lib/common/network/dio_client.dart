import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Создание Dio. Базовый адрес и таймауты записаны только здесь.
///
/// Dio создаётся один раз в app.dart и передаётся в API-клиент через
/// конструктор.
abstract final class DioClient {
  static const String baseUrl = 'https://plugins.jetbrains.com/api';

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        // Без таймаутов запрос к зависшему серверу ждёт сколько угодно.
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
    // Запросы и ответы пишутся в консоль только в debug.
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          responseBody: false,
          logPrint: (line) => debugPrint('[dio] $line'),
        ),
      );
    }
    return dio;
  }
}
