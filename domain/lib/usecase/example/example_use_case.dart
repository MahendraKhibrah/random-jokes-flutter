import 'dart:async';

import 'package:domain/models/example.dart';
import 'package:domain/models/resource_state.dart';
import 'package:domain/repository/example_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetExampleCase extends BaseUseCase<dynamic, Example> {
  final ExampleRepository _repository;

  GetExampleCase(this._repository);

  @override
  FutureOr<ResourceState<Example>> invoke(request) {
    return _repository.getExample();
  }
}
