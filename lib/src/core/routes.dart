import 'package:empriusapp/src/features/tool/presentation/screens/add_tool_screen.dart';
import 'package:empriusapp/src/features/bookings/presentation/ask_tool_form_screen.dart';
import 'package:empriusapp/src/features/tool/presentation/screens/tool_detail_screen.dart';
import 'package:empriusapp/src/features/tool/presentation/screens/tool_edit_card_screen.dart';
import 'package:empriusapp/src/features/user/auth_user/presentation/login_screen.dart';
import 'package:empriusapp/src/features/user/auth_user/presentation/register_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/screens/user_activity_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/screens/user_edit_profile_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/screens/user_inbox_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/screens/user_profile_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/screens/user_tool_list_screen.dart';
import 'package:flutter/material.dart';
import '../features/search_map/presentation/screens/search_map_screen.dart';
import '../features/main/splash_screen.dart';
import '../features/user/emprius_user/domain/user_model.dart';

const String loginScreenRoute = "/login";
const String searchMapScreenRoute = "/home";
const String registerScreenRoute = "/register";
const String userProfileScreenRoute = "/user-profile";
const String editProfileScreenRoute = "/edit-profile";
const String userActivityScreenRoute = "/user-activty";
const String userInboxScreenRoute = "/user-inbox";
const String userToolsScreenRoute = "/user-toollist";
const String toolDetailScreenRoute = "/tool-detail";
const String toolEditCardScreenRoute = "/edit-tool";
const String toolAddFormScreenRoute = "/tool-form";
const String toolAskFormScreenRoute = "/ask-tool-form";
const String splashScreenRoute = "/splash";

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginScreenRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case searchMapScreenRoute:
        return MaterialPageRoute(builder: (_)=> SearchMapScreen());
      case registerScreenRoute:
        return MaterialPageRoute(builder: (_)=> RegisterScreen());
      case userProfileScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserProfileScreen());
      case editProfileScreenRoute:
        return MaterialPageRoute(
            builder: (_)=> UserEditProfileScreen(settings.arguments as EditProfileArguments));
      case userActivityScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserActivityScreen());
      case userInboxScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserInboxScreen());
      case userToolsScreenRoute:
        return MaterialPageRoute(builder: (_)=> UserToolList());
      case toolDetailScreenRoute:
        return MaterialPageRoute(
            builder: (_)=> ToolDetailScreen(settings.arguments as ToolDetailArguments));
      case toolEditCardScreenRoute:
        return MaterialPageRoute(builder: (_)=> ToolEditCardScreen(settings.arguments as EditToolArguments));
      case toolAddFormScreenRoute:
        return MaterialPageRoute(builder: (_)=> AddToolScreen());
      // case toolAskFormScreenRoute:
      //   return MaterialPageRoute(
      //       builder: (_)=> AskToolFormScreen(settings.arguments as ToolDetailArguments));
    }
  }
}

class EditProfileArguments{
  UserModel user;
  EditProfileArguments(this.user);
}

class ToolDetailArguments{
  int id;
  ToolDetailArguments(this.id);
}

class EditToolArguments{
  int id;
  EditToolArguments(this.id);
}