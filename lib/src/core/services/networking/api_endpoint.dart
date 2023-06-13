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
    switch (endpoint) {
      case AuthEndpoint.REGISTER: return '/register';
      case AuthEndpoint.LOGIN: return '/login';
      case AuthEndpoint.REFRESH_TOKEN: return '/refresh';
    }
  }

  static String profile(ProfileEndpoint endpoint) {
    const path = '/profile';
    switch (endpoint) {
      case ProfileEndpoint.BASE: return '$path';
    }
  }

  /// Enums for different endpoints collections:
  ///
  /// Returns the path for a user bookings [endpoint].
  ///
  /// Specify student connection [id] to get the path for a specific student connection.
  // static String userConnections(StudentConnectionEndpoint endpoint, {int? id}) {
  //   const path = '/user-connections';
  //   switch(endpoint){
  //     case StudentConnectionEndpoint.BASE: return path;
  //     case StudentConnectionEndpoint.REQUESTS: return '$path/bookings';
  //     case StudentConnectionEndpoint.BY_ID: {
  //       assert(id != null, 'userBookingsId is required for BY_ID endpoint');
  //       return '$path/$id';
  //     }
  //   }
  // }
  //
  // /// Returns the path for interests [endpoint].
  // static String interests(InterestEndpoint endpoint) {
  //   const path = '/interests';
  //   switch (endpoint) {
  //     case InterestEndpoint.BASE: return path;
  //   }
  // }
}

/// A collection of endpoints used for authentication purposes.
enum AuthEndpoint {
  /// An endpoint for registration requests.
  REGISTER,

  /// An endpoint for login requests.
  LOGIN,

  /// An endpoint for token refresh requests.
  REFRESH_TOKEN,
}

enum ProfileEndpoint {
  BASE,
}

/// A collection of endpoints used for students.
// enum StudentEndpoint {
//   /// An endpoint for students' collection requests.
//   BASE,
//
//   /// An endpoint for individual students requests.
//   BY_ERP,
//
//   /// An endpoint for a student's organized activities
//   ORGANIZED_ACTIVITIES,
//
//   /// An endpoint for a student's saved activities
//   SAVED_ACTIVITIES_BASE,
//
//   /// An endpoint for a student's specific saved activity
//   SAVED_ACTIVITIES_BY_ID,
//
//   /// An endpoint for a student's attended activities
//   ATTENDED_ACTIVITIES,
// }
//
// /// A collection of endpoints used for student connections.
// enum StudentConnectionEndpoint {
//   /// An endpoint for a student's connections' collection requests.
//   BASE,
//
//   /// An endpoint for a student's pending connection requests.
//   REQUESTS,
//
//   /// An endpoint for a student's individual connection's requests.
//   BY_ID,
// }
//
// /// A collection of endpoints used for interests.
// enum InterestEndpoint {
//   /// An endpoint for interests' collection requests.
//   BASE,
// }