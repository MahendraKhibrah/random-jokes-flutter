import 'dart:async';

import '../../models/resource_state.dart';

abstract class BaseUseCase<REQ, RES> {
  FutureOr<ResourceState<RES>> invoke(REQ request);
}
