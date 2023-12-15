import 'package:common/common.dart';
import 'package:data/repository/exapmple_repository.dart';
import 'package:data/repository/random_jokes_repository.dart';
import 'package:domain/repository/example_repository.dart';
import 'package:domain/repository/random_jokes_repository.dart';
import 'package:domain/usecase/example/example_use_case.dart';
import 'package:domain/usecase/jokes/get_random_jokes_usecase.dart';

@module
abstract class DomainModule {
  @LazySingleton(as: ExampleRepository)
  ExampleRepositoryImpl get exampleRepository;

  @LazySingleton(as: RandomJokesRepository)
  RandomJokesRepositoryImpl get randomJokesRepository;

  @lazySingleton
  GetExampleCase get getExampleCase;

  @lazySingleton
  GetRandomJokes get getRandomJokes;
}
