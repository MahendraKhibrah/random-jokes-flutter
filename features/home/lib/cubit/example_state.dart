part of 'example_cubit.dart';

@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState.initial() = _Initial;
  const factory ExampleState.loading() = _Loading;
  const factory ExampleState.error(Exception exception) = _error;
  const factory ExampleState.success(Example example) = _Success;
}
