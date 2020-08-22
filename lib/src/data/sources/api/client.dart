import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:template/src/core/result.dart';
import '../../../core/failure.dart';

import 'i_client_contract.dart';

class Api extends Client {}

Future<bool> _isConnected() async =>
    await DataConnectionChecker().hasConnection;
//Maybe refactor as an interceptor
Future<Failure> DioErrorHandler(
    DioError e, Map<int, String> extraErrors) async {
  if (e.error is SocketException) {
    return Failure(
        message: "Couldn't connect to the server. Please try again soon.",
        type: FailureType.Server);
  } else if (e.response == null) {
    if (!await _isConnected())
      return Failure(
          message:
              "No internet connection. Please checked you're connected to the internet.",
          type: FailureType.NoInternet);
    else
      return Failure(
          message: "Couldn't connect to the server. Please try again soon.");
  }
  return Failure(
      message: "Unknown error, could not connect to the server,",
      type: FailureType.Unknown);
}
