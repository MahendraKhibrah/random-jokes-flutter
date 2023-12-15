import 'dart:async';
import 'dart:convert';

import 'package:data/api/random_jokes_api.dart';
import 'package:data/extention/response_ext.dart';
import 'package:domain/models/joke.dart';
import 'package:domain/models/resource_state.dart';
import 'package:domain/repository/random_jokes_repository.dart';

class RandomJokesRepositoryImpl extends RandomJokesRepository {
  final RandomJokesApi _randomJokesApi;

  RandomJokesRepositoryImpl(this._randomJokesApi);

  @override
  FutureOr<ResourceState<Joke>> getRandomJoke() async {
    return await _randomJokesApi.getJokes().mapToEntity(
      (p0) {
        return Joke.fromJson(json.decode(p0));
      },
    );
  }

  @override
  FutureOr<ResourceState<List<Joke>>> getTenRandomJoke() {
    // TODO: implement getTenRandomJoke
    throw UnimplementedError();
  }
}
