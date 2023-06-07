import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// An enum that holds names for our custom exceptions.
enum _ExceptionType {
  /// The exception for an expired bearer token.
  TokenExpiredException,

  /// The exception for a prematurely cancelled request.
  CancelException,

  /// The exception for a failed connection attempt.
  ConnectTimeoutException,

  /// The exception for failing to send a request.
  SendTimeoutException,

  /// The exception for failing to receive a response.
  ReceiveTimeoutException,

  /// The exception for no internet connectivity.
  SocketException,

  /// A better name for the socket exception.
  FetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  FormatException,

  /// The exception for an unknown type of failure.
  UnrecognizedException,

  /// The exception for an unknown exception from the api.
  ApiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  SerializationException,
}

class CustomException implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final _ExceptionType exceptionType;

  CustomException({
    this.code,
    int? statusCode,
    required this.message,
    this.exceptionType = _ExceptionType.ApiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory CustomException.fromDioException(Exception error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return CustomException(
              exceptionType: _ExceptionType.CancelException,
              statusCode: error.response?.statusCode,
              message: 'Request cancelled prematurely',
            );
          case DioErrorType.connectionTimeout:
            return CustomException(
              exceptionType: _ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
            );
          case DioErrorType.sendTimeout:
            return CustomException(
              exceptionType: _ExceptionType.SendTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to send',
            );
          case DioErrorType.receiveTimeout:
            return CustomException(
              exceptionType: _ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive',
            );
          case DioErrorType.badResponse:
          case DioErrorType.unknown:
            if (error.message?.contains(_ExceptionType.SocketException.name) ?? false) {
              return CustomException(
                exceptionType: _ExceptionType.FetchDataException,
                statusCode: error.response?.statusCode,
                message: 'No internet connectivity',
              );
            }
            // todo(kon): implement headers
            // if (error.response?.data['headers']['code'] == null) {
            //   return CustomException(
            //     exceptionType: _ExceptionType.UnrecognizedException,
            //     statusCode: error.response?.statusCode,
            //     message: error.response?.statusMessage ?? 'Unknown',
            //   );
            // }
            // final name = error.response?.data['headers']['code'] as String;
            // final message =
            // error.response?.data['headers']['message'] as String;
            // todo(kon): implement token expired exception
            // if (name == _ExceptionType.TokenExpiredException.name) {
            //   return CustomException(
            //     exceptionType: _ExceptionType.TokenExpiredException,
            //     code: name,
            //     statusCode: error.response?.statusCode,
            //     message: message,
            //   );
            // }
            // todo(kon): implement this
            return CustomException(
              message: "Unhandled exception",
              // message: message,
              code: error.message,
              // code: name,
              statusCode: error.response?.statusCode,
            );
        }
      }
      return CustomException(
        exceptionType: _ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    } on FormatException catch (e) {
      return CustomException(
        exceptionType: _ExceptionType.FormatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return CustomException(
        exceptionType: _ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  /// A factory to convert serialization errors:
  factory CustomException.fromParsingException(Exception error) {
    debugPrint('$error');
    return CustomException(
      exceptionType: _ExceptionType.SerializationException,
      message: 'Failed to parse network response to model or vice versa',
    );
  }
}
