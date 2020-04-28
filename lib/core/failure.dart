import 'package:flutter/foundation.dart';

enum FailureType { Server, NoInternet, Default, Unknown }

class Failure {
  String message;
  FailureType type;

  Failure({@required this.message, this.type = FailureType.Default});
}
