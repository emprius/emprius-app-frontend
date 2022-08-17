import 'package:empriusapp/core/helper/utils/constants.dart';
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{

  const UserModel._();

  const factory UserModel({
    String? name,
    required int id,
    required String email,
    required String password,
    required String invitation,
    required LatLng? location,
    bool? isActive,
    String? avatar,
    @Default(3) int? rating,
    @Default(10) int? emps,
  }) = _UserModel;

  /// Dummy factory to initialize a UserModel with default data. 
  factory UserModel.initial() =>
    UserModel(
        id: -1,
        email: "email",
        password: "password",
        invitation: "invitation",
        location: defaultMapCenter);

  bool get isDummyUser => id == -1;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}