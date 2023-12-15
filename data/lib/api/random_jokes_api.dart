import 'dart:async';

import 'package:common/utils/env.dart';
import 'package:dio/dio.dart';

class RandomJokesApi {
  final Dio _dio;
  final baseUrl = AppEnv.baseMainUrl;

  RandomJokesApi(this._dio);

  FutureOr<Response> getJokes() async {
    return await _dio.get('$baseUrl/random_joke');
  }
}
