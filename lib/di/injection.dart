import 'package:common/di/injection.dart';
import 'package:common/common.dart';
import 'package:clean_architecture_template/di/injection.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void getDependencies() {
  getIt.init();
}
