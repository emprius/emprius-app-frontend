import 'package:flutter/material.dart';
import 'package:empriusapp/views/screens/home_screen.dart';
import 'package:empriusapp/views/screens/login_screen.dart';
import 'package:empriusapp/views/screens/register_screen.dart';
import 'package:empriusapp/views/screens/user_profile_screen.dart';
import '../views/screens/edit_profile_screen.dart';
import '../views/screens/user_activity_screen.dart';
import '../views/screens/user_inbox_screen.dart';

const String loginScreenRoute = "/login";
const String homeScreenRoute = "/home";
const String registerScreenRoute = "/register";
const String userProfileScreenRoute = "/user-profile";
const String editProfileScreenRoute = "/edit-profile";
const String userActivityScreenRoute = "/user-activty";
const String userInboxScreenRoute = "/user-inbox";

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_)=> HomeScreen());
      case registerScreenRoute:
        return MaterialPageRoute(builder: (_)=> RegisterScreen());
      case userProfileScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserProfileScreen());
        case editProfileScreenRoute:
          return MaterialPageRoute(builder: (_)=> EditProfileScreen());
      case userActivityScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserActivityScreen());
      case userInboxScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserInboxScreen());
    }
  }
}
