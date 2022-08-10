// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      name: json['name'] as String?,
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      invitation: json['invitation'] as String,
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool?,
      avatar: json['avatar'] as String?,
      rating: json['rating'] as int? ?? 3,
      emps: json['emps'] as int? ?? 10,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'invitation': instance.invitation,
      'location': instance.location,
      'isActive': instance.isActive,
      'avatar': instance.avatar,
      'rating': instance.rating,
      'emps': instance.emps,
    };
