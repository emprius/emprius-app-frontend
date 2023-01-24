import 'package:empriusapp/src/features/search_map/presentation/widgets/marker_popup.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMarker extends Marker {

  MarkerPopup? popup;

  CustomMarker({this.popup, required super.point, required super.builder});

  factory CustomMarker.fromToolModel(ToolModel tool){
    if(tool.isAvailable) {
      return CustomMarker(
         popup: MarkerPopup.fromToolModel(tool),
          point: tool.location!,
          builder: (ctx) => BaseMarker.availableTool());
    } else {
      return CustomMarker(
          popup: MarkerPopup.fromToolModel(tool),
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
  IconData _iconData = Icons.location_on_outlined;
  final Color color;

  BaseMarker({Key? key, iconData, required this.color}) :  super(key: key){
    if(iconData != null) _iconData = iconData;
  }

  BaseMarker.availableTool() : color = const Color(0xFFE7E885);
  // BaseMarker.availableTool({this.color = Colors.red});

  BaseMarker.bookedTool() : color = const Color(0xFF606042);

  BaseMarker.userMarker() : color = const Color(0xFFFCD8DF);

  BaseMarker.tapMarker() : color = const Color(0xFFB1384E);

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