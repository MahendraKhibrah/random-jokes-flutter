import 'package:common/common.dart';
import 'package:home/cubit/jokes_cubit.dart';

@module
abstract class HomeModule {
  @injectable
  JokesCubit get jokesCubit;
}
