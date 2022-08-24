// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToolModel _$$_ToolModelFromJson(Map<String, dynamic> json) => _$_ToolModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
      isAvailable: json['isAvailable'] as bool? ?? true,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      needsTransport: json['needsTransport'] as bool?,
      maybeFree: json['maybeFree'] as bool?,
      rating: json['rating'] as int?,
      cost: json['cost'] as int?,
      askWithFee: json['askWithFee'] as bool?,
      estimatedValue: (json['estimatedValue'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ToolModelToJson(_$_ToolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'isAvailable': instance.isAvailable,
      'images': instance.images,
      'needsTransport': instance.needsTransport,
      'maybeFree': instance.maybeFree,
      'rating': instance.rating,
      'cost': instance.cost,
      'askWithFee': instance.askWithFee,
      'estimatedValue': instance.estimatedValue,
      'height': instance.height,
      'width': instance.width,
      'length': instance.length,
      'weight': instance.weight,
    };
