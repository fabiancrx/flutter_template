import 'package:meta/meta.dart';

@immutable
class Environment {
  final String url;

  final String apiKey;

  Environment(this.url, [this.apiKey = 'defaultApiKey']);

  factory Environment.production() => throw UnimplementedError('');

  factory Environment.test() => throw UnimplementedError('');

  factory Environment.development() => throw UnimplementedError('');
}
