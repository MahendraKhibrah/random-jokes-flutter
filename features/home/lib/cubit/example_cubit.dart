import 'package:common/common.dart';
import 'package:domain/models/example.dart';
import 'package:domain/usecase/example/example_use_case.dart';

part 'example_cubit.freezed.dart';
part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  final GetExampleCase _getExampleUseCase;

  ExampleCubit(this._getExampleUseCase) : super(const ExampleState.initial());

  void getExample() async {
    emit(const ExampleState.loading());
    final resource = await _getExampleUseCase.invoke('');
    resource.map(
        failure: (e) => emit(ExampleState.error(e.exception)),
        success: (value) => emit(ExampleState.success(value.data)));
  }
}
