import 'dart:async';

import 'package:common/utils/env.dart';
import 'package:dio/dio.dart';

class ExampleApi {
  final Dio _dio;
  final baseUrl = AppEnv.baseMainUrl;

  ExampleApi(this._dio);

  FutureOr<Response> getJokes() async {
    return await _dio.get(
      baseUrl,
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '6a3a8359b0msh95017bb04088c12p16f5ecjsnbebf57d1e453',
          'X-RapidAPI-Host': 'dad-jokes.p.rapidapi.com'
        },
      ),
    );
  }
}
