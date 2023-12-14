// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // if (err.response?.statusCode != null) {
    //   try {
    //     final responseBody = json.decode(err.response?.data);

    //     final response = err.response;

    //     responseBody.code = err.response?.statusCode;

    //     final errorMessage =
    //         responseBody.message ?? err.message ?? 'Unknown error';

    //     response?.data = errorMessage;

    //     return super.onError(
    //       DioException(
    //         requestOptions: err.requestOptions,
    //         response: response,
    //         message: errorMessage,
    //       ),
    //       handler,
    //     );
    //   } on Exception {
    //     return super.onError(err, handler);
    //   }
    // }
    debugPrint('status : ${err.response?.statusCode}');
    debugPrint('field : ${err.response}');
    return super.onError(err, handler);
  }
}
