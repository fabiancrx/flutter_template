import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.gen.freezed.dart';

@freezed
abstract class Failure with _$Failure implements Exception {
  const factory Failure.noData(String message) = NoData;

  const factory Failure.noInternet(String message) = NoInternet;

  const factory Failure.serverError(String message) = ServerError;

  const factory Failure.unknown(String message) = Unknown;
}
