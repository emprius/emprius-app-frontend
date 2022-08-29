import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


@JsonEnum()
enum ToolCategory{
  @JsonValue('Vehicle') VEHICLE,
  @JsonValue('Construction') CONSTRUCTION,
  @JsonValue('Energy') ENERGY,
  @JsonValue('Gardening') GARDENING,
  @JsonValue('Woodwork') WOODWORK,
}

extension ExtToolCategory on ToolCategory{
  String get name => describeEnum(this);
  String? get displayName {
    switch (this) {
      case ToolCategory.VEHICLE:
        return 'Vehicle';
      case ToolCategory.CONSTRUCTION:
        return 'Construccio';
      case ToolCategory.ENERGY:
        return 'Energia';
      case ToolCategory.GARDENING:
        return 'Hort';
      case ToolCategory.WOODWORK:
        return 'Fusteria';
      default:
        return null;
    }
  }
}