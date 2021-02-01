import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:fresh_dio/fresh_dio.dart';

class AppDio with DioMixin implements Dio {

  AppDio._(String baseUrl, {bool cache = false}) {
    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );
    if (cache) {
      interceptors..add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    }
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance(String baseUrl) => AppDio._(baseUrl);
}

