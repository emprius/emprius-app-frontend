import 'dart:convert';

import 'package:empriusapp/utils/constants.dart';

import '../models/user_model.dart';
import 'package:latlong2/latlong.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  //TODO (Mayu): delete mock
  static var myUser = UserModel(
    name: "Nesa",
    id: 1,
    email: "nesa@mail.com",
    password: "12345678",
    invitation: "345",
    location: defaultMapCenter,
    avatar: "https://static.remove.bg/remove-bg-web/5c20d2ecc9ddb1b6c85540a333ec65e2c616dbbd/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png",
    rating: 3,
    isActive: true,
    emps: 10,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(UserModel user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static UserModel? getUser() {
    final json = _preferences.getString(_keyUser);
    // return json == null ? null : UserModel.fromJson(jsonDecode(json));

    return json == null ? myUser : UserModel.fromJson(jsonDecode(json));
  }


}