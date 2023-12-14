import 'package:common/common.dart';

part 'example.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Example with _$Example {
  const factory Example({
    required int id,
    required String name,
  }) = _Example;
}
