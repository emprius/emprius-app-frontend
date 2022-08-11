import 'package:flutter/material.dart';
import '../../domain/tool_model.dart';
import '../../domain/user_model.dart';
import '../screens/add_tool_screen.dart';
import '../screens/ask_tool_form_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/tool_card_screen.dart';
import '../screens/user_activity_screen.dart';
import '../screens/user_inbox_screen.dart';
import '../screens/user_profile_screen.dart';
import '../screens/user_tool_list_screen.dart';

const String loginScreenRoute = "/login";
const String homeScreenRoute = "/home";
const String registerScreenRoute = "/register";
const String userProfileScreenRoute = "/user-profile";
const String editProfileScreenRoute = "/edit-profile";
const String userActivityScreenRoute = "/user-activty";
const String userInboxScreenRoute = "/user-inbox";
const String userToolsScreenRoute = "/user-toollist";
const String toolCardScreenRoute = "/tool-card";
const String toolAddFormScreenRoute = "/tool-form";
const String toolAskFormScreenRoute = "/ask-tool-form";
const String splashScreenRoute = "/";

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeScreenRoute:
        return MaterialPageRoute(builder: (_)=> HomeScreen());
      case registerScreenRoute:
        return MaterialPageRoute(builder: (_)=> RegisterScreen());
      case userProfileScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserProfileScreen());
      case editProfileScreenRoute:
        return MaterialPageRoute(
            builder: (_)=> EditProfileScreen(settings.arguments as EditProfileArguments));
      case userActivityScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserActivityScreen());
      case userInboxScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserInboxScreen());
      case userToolsScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserToolList());
      case toolCardScreenRoute:
        return MaterialPageRoute(builder: (_)=> ToolCardScreen());
      case toolAddFormScreenRoute:
        return MaterialPageRoute(builder: (_)=> AddToolScreen());
      case toolAskFormScreenRoute:
        return MaterialPageRoute(
            builder: (_)=> AskToolFormScreen(settings.arguments as ToolDetailArguments));
    }
  }
}

class EditProfileArguments{
  UserModel user;
  EditProfileArguments(this.user);
}

class ToolDetailArguments{
  ToolModel tool;
  ToolDetailArguments(this.tool);
}