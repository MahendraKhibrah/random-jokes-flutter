import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:domain/models/resource_state.dart';

extension ResponseExt<T> on FutureOr<Response<T>> {
  Future<ResourceState<R>> mapToEntity<R>(R Function(T) mapper) async {
    try {
      final response = await this;
      final statusCode = response.statusCode ?? noInternetStatusCode;
      final isSuccessful = statusCode >= 200 && statusCode < 300;
      final data = mapper(response.data as T);

      if (isSuccessful) {
        return ResourceState<R>.success(
          data,
          statusCode,
        );
      } else {
        return ResourceState<R>.failure(
          Exception(response.statusMessage),
          data,
          noInternetStatusCode,
        );
      }
    } on SocketException catch (exception) {
      return ResourceState<R>.failure(
        exception,
        null,
        noInternetStatusCode,
      );
    } on DioException catch (exception) {
      return ResourceState<R>.failure(
        Exception(exception.message),
        null,
        exception.response?.statusCode ?? noInternetStatusCode,
      );
    } on Exception catch (exception) {
      return ResourceState<R>.failure(
        exception,
        null,
        500,
      );
    }
  }
}

const noInternetStatusCode = 1001;
