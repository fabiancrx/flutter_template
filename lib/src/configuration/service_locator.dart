import 'package:get_it/get_it.dart';
import 'package:template/src/core/services/navigation.dart';
export 'package:template/src/shared/extensions/index.dart';

GetIt service = GetIt.instance;

/// Inject dependencies that are stateless
// in other words dependencies that live for the lifetime of the app
Future<void> inject() async {
  service.registerLazySingleton<Navigation>(() => Navigation());
  registerDependencies();
}

/// Register dependencies that handle state or are session bound
void registerDependencies() {}

/// unregister dependencies that handle state or are session bound
void unregisterDependencies() {}

void resetDependencies() {
  unregisterDependencies();
  registerDependencies();
}
