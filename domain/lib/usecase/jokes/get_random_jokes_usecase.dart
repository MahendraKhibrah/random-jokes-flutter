import 'dart:async';

import 'package:domain/models/joke.dart';
import 'package:domain/models/resource_state.dart';
import 'package:domain/repository/random_jokes_repository.dart';
import 'package:domain/usecase/base/base_use_case.dart';

class GetRandomJokes extends BaseUseCase<dynamic, Joke> {
  final RandomJokesRepository _repository;

  GetRandomJokes(this._repository);

  @override
  FutureOr<ResourceState<Joke>> invoke(request) {
    return _repository.getRandomJoke();
  }
}
