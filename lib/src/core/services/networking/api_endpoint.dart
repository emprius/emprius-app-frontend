import 'package:empriusapp/src/core/config/config.dart';
import 'package:flutter/material.dart';

/// A utility class for getting paths for API endpoints
/// without involving strings.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// The base url of our REST API, to which all the requests will be sent.
  /// It is supplied at the time of building the apk or running the app:
  /// ```
  /// flutter build apk --debug --dart-define=BASE_URL=www.some_url.com
  /// ```
  /// OR
  /// ```
  /// flutter run --dart-define=BASE_URL=www.some_url.com
  /// ```
  static const baseUrl = Config.baseUrl;

  /// Returns the path for an authentication [endpoint].
  static String auth(AuthEndpoint endpoint) {
    const path = '/auth';
    switch (endpoint) {
      case AuthEndpoint.REGISTER: return '$path/register';
      case AuthEndpoint.LOGIN: return '$path/login';
      case AuthEndpoint.REFRESH_TOKEN: return '$path/refresh-token';
      case AuthEndpoint.CHANGE_PASSWORD: return '$path/change-password';
      case AuthEndpoint.FORGOT_PW_SEND_OTP: return '$path/forgot/send-otp';
      case AuthEndpoint.FORGOT_PW_VERIFY_OTP: return '$path/forgot/verify-otp';
      case AuthEndpoint.FORGOT_PW_RESET_PASSWORD: return '$path/forgot/reset-password';
    }
  }
}

/// A collection of endpoints used for authentication purposes.
enum AuthEndpoint {
  /// An endpoint for registration requests.
  REGISTER,

  /// An endpoint for login requests.
  LOGIN,

  /// An endpoint for token refresh requests.
  REFRESH_TOKEN,

  /// An endpoint for change password requests.
  CHANGE_PASSWORD,

  /// An endpoint for reset password requests.
  FORGOT_PW_RESET_PASSWORD,

  /// An endpoint for forget password otp requests.
  FORGOT_PW_SEND_OTP,

  /// An endpoint for verifying forgot password otp code.
  FORGOT_PW_VERIFY_OTP,
}

/// A collection of endpoints used for students.
enum StudentEndpoint {
  /// An endpoint for students' collection requests.
  BASE,

  /// An endpoint for individual students requests.
  BY_ERP,

  /// An endpoint for a student's organized activities
  ORGANIZED_ACTIVITIES,

  /// An endpoint for a student's saved activities
  SAVED_ACTIVITIES_BASE,

  /// An endpoint for a student's specific saved activity
  SAVED_ACTIVITIES_BY_ID,

  /// An endpoint for a student's attended activities
  ATTENDED_ACTIVITIES,
}

/// A collection of endpoints used for student connections.
enum StudentConnectionEndpoint {
  /// An endpoint for a student's connections' collection requests.
  BASE,

  /// An endpoint for a student's pending connection requests.
  REQUESTS,

  /// An endpoint for a student's individual connection's requests.
  BY_ID,
}

/// A collection of endpoints used for interests.
enum InterestEndpoint {
  /// An endpoint for interests' collection requests.
  BASE,
}