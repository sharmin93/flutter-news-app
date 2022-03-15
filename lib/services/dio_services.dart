import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioService {
  static final DioService _singleton = DioService._internal();

  DioService._internal();

  static DioService get instance => _singleton;

  var dio = Dio();

  void create() {
    BaseOptions options = BaseOptions(
      connectTimeout: 180000,
      receiveTimeout: 180000,
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          print("= = = Dio Request = = =");
          print(options.headers);
          print(options.contentType);
          print(options.extra);
          print(options.baseUrl + "" + options.path);
          print(options.data);
        }
        return handler.next(options);
      },
      onError: (DioError error, handler) async {
        if (kDebugMode) {
          print("= = = Dio Error Response = = =");
          print('Error Response: ${error.response}');
          print('Error Message: ${error.message}');
          print('Error Type: ${error.type}');
        }

        return handler.next(error);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print("= = = Dio Success Response = = =");
          print(response.headers);
          print(response.requestOptions.baseUrl + response.requestOptions.path);
          print(response.statusCode);
          print(response.extra);
          print(json.encode(response.data));
        }
        return handler.next(response);
      },
    ));
  }
}

//HTTPS Without Token ->
Future getHttp({required String path}) async {
  var service = DioService.instance.dio.get(path);
  return service;
}
