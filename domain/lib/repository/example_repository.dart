import 'dart:async';

import 'package:domain/models/example.dart';
import 'package:domain/models/resource_state.dart';

abstract class ExampleRepository {
  FutureOr<ResourceState<Example>> getExample();
}
