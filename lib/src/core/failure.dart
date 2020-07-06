import 'package:flutter/foundation.dart';

enum FailureType { Server, NoInternet, Default, Unknown }

class Failure extends Exception {
  FailureType type;
  String message;

  Failure({@required this.message, this.type = FailureType.Default}) : super(message: message, cause: "");
}

abstract class Exception {
  /// Message created by the programmer to be reflected in the UI.
  String message;

  /// Cause internal to the class and should be passed directly from any subclass
  /// to the super
  String cause;

  StackTrace get stackTrace => StackTrace.current;

  Exception({this.message, @required this.cause});
}
