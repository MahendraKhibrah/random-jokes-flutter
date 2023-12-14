import 'dart:io';

import 'package:dio/dio.dart';
import 'package:common/utils/locale.dart';
import 'package:flutter/foundation.dart';

class DioHttpIntreceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['device'] = Platform.isAndroid ? 'Android' : 'iOS';
    options.headers['app-name'] = 'partner';
    options.headers['client-lang'] = getLocaleName();

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}]: ${response.requestOptions.uri}');
    debugPrint('RESPONSE HEADERS: ${response.headers}');
    debugPrint('RESPONSE DATA: ${response.data}');
    super.onResponse(response, handler);
  }
}
