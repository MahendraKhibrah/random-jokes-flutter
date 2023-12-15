part of 'jokes_cubit.dart';

@freezed
class JokesState with _$JokesState {
  const factory JokesState.initial() = _Initial;
  const factory JokesState.loading() = _Loading;
  const factory JokesState.error(Exception exception) = _error;
  const factory JokesState.success(Joke joke) = _Success;
}
