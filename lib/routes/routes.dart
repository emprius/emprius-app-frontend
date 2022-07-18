import 'package:empriusapp/views/screens/home_screen.dart';
import 'package:empriusapp/views/screens/login_screen.dart';
import 'package:flutter/material.dart';

const String loginScreenRoute = "/login";
const String homeScreenRoute = "/home";

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "/home":
        return MaterialPageRoute(builder: (_)=> HomeScreen());
    }
  }
}
