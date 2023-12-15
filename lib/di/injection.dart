import 'package:common/di/injection.dart';
import 'package:common/common.dart';
import 'package:random_jokes/di/injection.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void getDependencies() {
  getIt.init();
}
