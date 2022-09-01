import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class CustomMarker extends Marker {

  CustomMarker({required super.point, required super.builder});

  factory CustomMarker.fromToolModel(ToolModel tool){
    if(tool.isAvailable) {
      return CustomMarker(
          point: tool.location!,
          builder: (ctx) => BaseMarker.availableTool());
    } else {
      return CustomMarker(
        point: tool.location!,
        builder: (ctx) => BaseMarker.bookedTool());
    }
  }

  factory CustomMarker.fromUserModel(UserModel user){
    return CustomMarker(
        point: user.location!,
        builder: (ctx) => BaseMarker.userMarker());
  }


  factory CustomMarker.tapMarker(LatLng tapLocation){
    return CustomMarker(
        point: tapLocation,
        builder: (ctx) => BaseMarker.tapMarker());
  }
}


class BaseMarker extends StatelessWidget {
  IconData _iconData = Icons.location_on_sharp;
  final Color color;

  BaseMarker({Key? key, iconData, required this.color}) :  super(key: key){
    if(iconData != null) _iconData = iconData;
  }

  BaseMarker.availableTool() : color = Colors.green;
  // BaseMarker.availableTool({this.color = Colors.red});

  BaseMarker.bookedTool() : color = Colors.black12;

  BaseMarker.userMarker() : color = Colors.blueAccent;

  BaseMarker.tapMarker() : color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
          _iconData,
          color: color,
          size: 45.0),
    );
  }
}