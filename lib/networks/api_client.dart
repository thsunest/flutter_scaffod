import 'package:dio/dio.dart';
import 'package:flutter_scaffod/networks/api_interceptor.dart';

import '../configs/app_config.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
   late final Dio dio;
  ApiClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));
    dio.interceptors.add(ApiInterceptors(dio: dio));

  }
}
