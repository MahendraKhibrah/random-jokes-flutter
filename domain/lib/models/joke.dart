import 'dart:convert';

import 'package:common/common.dart';

part 'joke.freezed.dart';
part 'joke.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Joke with _$Joke {
  const factory Joke({
    @JsonKey(name: 'id') required String? id,
    @JsonKey(name: 'type') required String? type,
    @JsonKey(name: 'setup') required DateTime? setup,
    @JsonKey(name: 'punchline') required String? punchline,
  }) = _Article;

  factory Joke.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$JokeFromJson(json);

  factory Joke.fromRawJson(String str) => Joke.fromJson(json.decode(str));
}
