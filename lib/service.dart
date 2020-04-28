import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:template/services/navigation.dart';

GetIt service = GetIt.instance;

Future<void> inject() async {
  Logger.level = Level.verbose;
  final logger = Logger(
      printer: PrettyPrinter(
          methodCount: 0, errorMethodCount: 5, lineLength: 50, colors: true, printEmojis: true, printTime: false));

  service.registerLazySingleton(() => logger);
  service.registerLazySingleton(() => NavigationService());
}
