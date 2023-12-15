import 'dart:async';

import 'package:domain/models/joke.dart';
import 'package:domain/models/resource_state.dart';

abstract class RandomJokesRepository {
  FutureOr<ResourceState<Joke>> getRandomJoke();
  FutureOr<ResourceState<List<Joke>>> getTenRandomJoke();
}
