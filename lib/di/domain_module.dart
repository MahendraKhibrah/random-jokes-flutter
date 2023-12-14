import 'package:common/common.dart';
import 'package:data/repository/exapmple_repository.dart';
import 'package:domain/repository/example_repository.dart';
import 'package:domain/usecase/example/example_use_case.dart';

@module
abstract class DomainModule {
  @LazySingleton(as: ExampleRepository)
  ExampleRepositoryImpl get exampleRepository;

  @lazySingleton
  GetExampleCase get getExampleCase;
}
