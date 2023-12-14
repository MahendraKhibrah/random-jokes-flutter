import 'dart:async';
import 'dart:convert';

import 'package:data/api/example_api.dart';
import 'package:data/extention/response_ext.dart';
import 'package:domain/models/resource_state.dart';
import 'package:domain/repository/example_repository.dart';
import 'package:domain/models/example.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleApi _exampleApi;

  ExampleRepositoryImpl(this._exampleApi);

  @override
  FutureOr<ResourceState<Example>> getExample() async {
    return await _exampleApi.getJokes().mapToEntity((val) => Example(
          id: json.decode(val)['body']?[0]?['id'] ?? 0,
          name: json.decode(val)['body']?[0]?['name'] ?? '',
        ));
  }
}
