import 'package:empriusapp/src/core/common_widgets/category_label.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';


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

  Object? get label {
    switch (this) {
      case ToolCategory.VEHICLE:
        return const CategoryLabel(
          text: 'Vehicles',
          color: Colors.redAccent,
          icon: Icons.car_rental,
        );
      case ToolCategory.CONSTRUCTION:
        return const CategoryLabel(
          text: 'Construccio',
          color: Colors.blueAccent,
          icon: Icons.construction,
        );
      case ToolCategory.ENERGY:
        return const CategoryLabel(
          text: 'Energia',
          color: Colors.orangeAccent,
          icon:   Icons.lightbulb,
        );
      case ToolCategory.GARDENING:
        return const CategoryLabel(
          text: 'Hort',
          color: Colors.lightGreen,
          icon: Icons.yard,
        );
      case ToolCategory.WOODWORK:
        return const CategoryLabel(
          text: 'Fusteria',
          color: Colors.brown,
          icon:  Icons.cabin,
        );
      default:
        return null;
    }
  }
}