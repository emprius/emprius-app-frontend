// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToolModel _$$_ToolModelFromJson(Map<String, dynamic> json) => _$_ToolModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      isAvailable: json['isAvailable'] as bool? ?? true,
      maybeFree: json['maybeFree'] as bool?,
      cost: json['cost'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      transportOptions: $enumDecodeNullable(
          _$TransportOptionsEnumMap, json['transportOptions']),
      toolCategory:
          $enumDecodeNullable(_$ToolCategoryEnumMap, json['toolCategory']),
      askWithFee: json['askWithFee'] as bool?,
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
      rating: json['rating'] as int?,
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
      'isAvailable': instance.isAvailable,
      'maybeFree': instance.maybeFree,
      'cost': instance.cost,
      'images': instance.images,
      'transportOptions': _$TransportOptionsEnumMap[instance.transportOptions],
      'toolCategory': _$ToolCategoryEnumMap[instance.toolCategory],
      'askWithFee': instance.askWithFee,
      'location': instance.location,
      'rating': instance.rating,
      'estimatedValue': instance.estimatedValue,
      'height': instance.height,
      'width': instance.width,
      'length': instance.length,
      'weight': instance.weight,
    };

const _$TransportOptionsEnumMap = {
  TransportOptions.NOT_NECESSARY: 'Not_necessary',
  TransportOptions.EXTRA_NECESSARY: 'Extra_necessary',
  TransportOptions.NECESSARY: 'Necessary',
};

const _$ToolCategoryEnumMap = {
  ToolCategory.VEHICLE: 'Vehicle',
  ToolCategory.CONSTRUCTION: 'Construction',
  ToolCategory.ENERGY: 'Energy',
  ToolCategory.GARDENING: 'Gardening',
  ToolCategory.WOODWORK: 'Woodwork',
};
