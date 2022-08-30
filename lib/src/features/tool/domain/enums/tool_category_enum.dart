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
    switch (this){
      case ToolCategory.VEHICLE:
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Vehicles'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.car_rental,
                size: 24.0,
              ),
            ],
          ),
        );
      case ToolCategory.CONSTRUCTION:
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Construccio'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.construction,
                size: 24.0,
              ),
            ],
          ),
        );
      case ToolCategory.ENERGY:
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Energia'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.lightbulb,
                size: 24.0,
              ),
            ],
          ),
        );
      case ToolCategory.GARDENING:
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.lightGreen,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Hort'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.yard,
                size: 24.0,
              ),
            ],
          ),
        );
      case ToolCategory.WOODWORK:
        return ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.brown,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Fusteria'),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.cabin,
                size: 24.0,
              ),
            ],
          ),
        );
      default:
        return null;
    }

  }

  //Marker get marker{}


}

class ToolLabel {
}