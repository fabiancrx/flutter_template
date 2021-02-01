import 'package:get_it/get_it.dart';

import 'app/services/navigation.dart';

GetIt service = GetIt.instance;

Future<void> inject() async {
  service.registerLazySingleton<Navigation>(() => Navigation());
}
