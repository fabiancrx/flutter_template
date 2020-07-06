import 'package:emoji_lumberdash/emoji_lumberdash.dart';
import 'package:get_it/get_it.dart';
import 'package:lumberdash/lumberdash.dart';

import 'services/navigation.dart';

GetIt service = GetIt.instance;

Future<void> inject() async {
  putLumberdashToWork(withClients: [EmojiLumberdash(printColors: false)]);
  logMessage("message");
  service.registerLazySingleton<Navigation>(() => Navigation());
}
