import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ExceptionBase implements Exception {
  ExceptionBase(this.message);

  final String message;
}

enum FailureType { server, noInternet, Default, unknown }
class AuthException extends ExceptionBase {
  AuthException(String message) : super(message);
}
class NetworkFailure implements ExceptionBase {
  final FailureType type;
  @override
  final String message;

  NetworkFailure(this.message, {this.type = FailureType.Default});
}

class TODO {
  void call() => throw UnimplementedError();
}
