import 'package:empriusapp/models/user_model.dart';
import 'package:empriusapp/views/screens/home_screen.dart';
import 'package:empriusapp/views/screens/login_screen.dart';
import 'package:empriusapp/views/screens/register_screen.dart';
import 'package:empriusapp/views/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

const String loginScreenRoute = "/login";
const String homeScreenRoute = "/home";
const String registerScreenRoute = "/register";
const String userProfileScreenRoute = "/user-profile";

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
    }
  }
}
