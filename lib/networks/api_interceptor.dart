import 'package:dio/dio.dart';
import 'package:flutter_scaffod/utils/nav_manager.dart';
import 'package:logger/logger.dart';

import '../utils/local_storage.dart';
import '../widgets/error_page.dart';

class ApiInterceptors extends Interceptor {
  
  final Dio dio;
  final Logger logger = Logger();
  ApiInterceptors({required this.dio});

  bool _isRefreshing = false;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = LocalStorage.getAccessToken();

    if (token != null) {
      options.headers['Authorization-Business'] = token;
    }

    ///打印请求参数
    Map detail = {
      "接口地址": "${options.baseUrl}${options.path}",
      "请求方式": options.method,
      "接口入参params": options.queryParameters,
      "接口入参data": options.data,
      "header": options.headers,
    };
    logger.d(detail);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ///打印请求结果
    Map detail = {
      "状态码": response.statusCode,
      "接口地址":
          "${response.requestOptions.baseUrl}${response.requestOptions.path}",
      "接口返回": response.data,
    };
    logger.d(detail);
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (!_isRefreshing) {
        _isRefreshing = true;
        // final refreshToken = currentUser?.tokens.refreshToken;
        final refreshToken = LocalStorage.getRefreshToken();

        if (refreshToken == null) {
          _redirectToLogin();
          return handler.reject(err);
        }

        try {
          final response = await Dio().post('/business/refreshToken', data: {
            'refreshToken': refreshToken,
          });

          final newAccessToken = response.data['data']['token'];
          final newRefreshToken = response.data['data']['refreshToken'];

          // final tokens = LoginResponseModel.fromJson(response.data['data']);

          // await injectionLocator<AuthProvider>().updateToken(tokens);
          LocalStorage.saveTokens(newAccessToken, newRefreshToken);

          final requestOptions = err.requestOptions;
          final retryResponse = await _retryRequest(requestOptions);
          _isRefreshing = false;
          handler.resolve(retryResponse);
        } catch (e) {
          _redirectToLogin();
          _isRefreshing = false;
          return handler.reject(err);
        }
      }
    } else if (err.response?.statusCode == 404) {
      NavManager.push(ErrorPage(errorMsg: "接口不存在"));
      return handler.reject(err);
    } else {
      return handler.next(err);
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    // final currentUser = injectionLocator<AuthProvider>().activeUser;
    // final token = currentUser?.tokens.token ?? '';
    final token = LocalStorage.getAccessToken();
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers..['Authorization-Business'] = token,
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  void _redirectToLogin() {
    LocalStorage.clearTokens();
    // NavManager.pushAndRemoveUntil(LoginStartPage());
  }
}
