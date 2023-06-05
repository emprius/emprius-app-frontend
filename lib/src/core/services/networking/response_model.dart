// Helpers
import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:empriusapp/src/core/helper/typedefs.dart';

/// This class prevents us from dealing with a Map object of response
/// which can lead to errors in case a key is mistyped.
/// It also allows debugger to infer type of our parsed JSON model
/// and offer better code-completion in IDE.
/// It contains the following classes:

/// One to represent the response and contains a generic data type
/// that we pass at each request level:
class ResponseModel<T> {
  // final _ResponseHeadersModel headers;
  final T body;

  const ResponseModel({
    // todo(kon): implement header models
    // required this.headers,
    required this.body,
  });

  factory ResponseModel.fromJson(JSON json) {
    return ResponseModel(
      // headers: _ResponseHeadersModel.fromJson(
      //   json['headers'] as JSON,
      // ),
      // body: json['body'] as T,
      body: json as T,
    );
  }
}

/// Other class to represent response headers:
class _ResponseHeadersModel {
  final bool error;
  final String message;
  final String? code;

  const _ResponseHeadersModel({
    required this.error,
    required this.message,
    this.code,
  });

  factory _ResponseHeadersModel.fromJson(JSON json) {
    return _ResponseHeadersModel(
      error: Constants.boolFromInt(json['error'] as int),
      message: json['message'] as String,
      code: json['code'] as String?,
    );
  }
}