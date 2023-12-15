import 'package:common/common.dart';
import 'package:domain/models/joke.dart';
import 'package:domain/usecase/jokes/get_random_jokes_usecase.dart';

part 'jokes_cubit.freezed.dart';
part 'jokes_state.dart';

class JokesCubit extends Cubit<JokesState> {
  final GetRandomJokes _getRandomJokesUseCase;

  JokesCubit(this._getRandomJokesUseCase) : super(const JokesState.initial());

  void getJoke() async {
    emit(const JokesState.loading());
    final resource = await _getRandomJokesUseCase.invoke('');
    resource.map(
        failure: (e) => emit(JokesState.error(e.exception)),
        success: (value) => emit(JokesState.success(value.data)));
  }
}
