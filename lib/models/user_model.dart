import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
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

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}