import 'package:common/common.dart';
import 'package:data/api/example_api.dart';
import 'package:data/api/random_jokes_api.dart';
import 'package:data/intreceptors/dio_http_intreceptors.dart';
import 'package:data/intreceptors/dio_error_interceptor.dart';

import 'package:dio/dio.dart';

@module
abstract class DataModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          responseType: ResponseType.plain,
          connectTimeout: const Duration(minutes: 10),
          receiveTimeout: const Duration(minutes: 10),
        ),
      )
        ..interceptors.add(DioHttpIntreceptor())
        ..interceptors.add(DioErrorInterceptor());

  @singleton
  ExampleApi get exampleApi;

  @singleton
  RandomJokesApi get randomJokesApi;
}
