import 'package:alica/alice.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:camping/domain/server_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum Method { post, get, put, delete }

const String _baseUrl = 'https://go.idarmon.uz';

class Rest {
  static final Rest _rest = Rest._internal();

  Rest._internal();

  bool isLogin = false;

  factory Rest() {
    if (true) {
      //kDebugMode
      final _ = Dio(
        BaseOptions(
          receiveTimeout: const Duration(seconds: 60),
          connectTimeout: const Duration(seconds: 60),
        ),
      )..interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true),
        );
      return _rest.._dio = _;
    } else {
      return _rest
        .._dio = Dio(
          BaseOptions(
            receiveTimeout: const Duration(seconds: 60),
            connectTimeout: const Duration(seconds: 60),
          ),
        );
    }
  }

  late Dio _dio;

  Future<Response?> request(
      {required String path,
      Method? method,
      Map<String, dynamic>? header,
      Map<String, dynamic>? params,
      Object? data}) async {
    method ??= Method.get;
    try {
      final result = await _dio.fetch(
          Options(method: method.name, headers: header)
              .compose(_dio.options, path, data: data, queryParameters: params)
              .copyWith(baseUrl: _baseUrl));

      if (result.data != null && true) {
        Alice(
          result: result,
          showNotification: true,
          navigatorKey: NavigationService.navigatorKey,
        );
      }
      isLogin = false;
      return result;
    } on DioException catch (_) {
      if (_.response?.data != null && true) {
        Alice(
          result: _.response,
          showNotification: true,
          navigatorKey: NavigationService.navigatorKey,
        );
      }
      ServerError.withError(error: _);

      if (!isLogin && _.response?.statusCode == 403) {
        getIt<LocalStorage>().setToken('');
        navigator.pushNamedAndRemoveUntil(RouteList.auth, (route) => false);
        isLogin = true;
      }

      if (kDebugMode) {
        print("error: ${_.type.name}");
      }
    }
    return null;
  }
}
