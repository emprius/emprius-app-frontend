// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String?,
      email: json['email'] as String,
      community: json['community'] as String?,
      tokens: json['tokens'] as int?,
      active: json['active'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      avatarHash: json['avatarHash'] as String?,
      location: _$JsonConverterFromJson<Map<String, dynamic>, LatLng>(
          json['location'], const LatLngConverter().fromJson),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'community': instance.community,
      'tokens': instance.tokens,
      'active': instance.active,
      'rating': instance.rating,
      'avatarHash': instance.avatarHash,
      'location': _$JsonConverterToJson<Map<String, dynamic>, LatLng>(
          instance.location, const LatLngConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
