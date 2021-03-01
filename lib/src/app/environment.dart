import 'package:meta/meta.dart';

@immutable
class Environment {
  final String url;

  final String apiKey;

  Environment(this.url, [this.apiKey = 'defaultApiKey']);

  factory Environment.production() => throw UnimplementedError('Not implemente default production environment');

  factory Environment.test() => throw UnimplementedError('Not implemente default testing environment');

  factory Environment.development() => throw UnimplementedError('Not implemente default development environment');
}
