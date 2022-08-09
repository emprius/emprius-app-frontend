import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Controller for [EmpriusMap] widget:
///
class EmpriusMapController {

  /// Selected location on the map onTap.
  ///
  /// Disabled if empriusMap [isViewOnly] is true.
  LatLng? selectedLocation;

  /// List of Markers to paint or already painted on the map
  List<Marker>? markers;

  /// Controller used to control the inner flutter_map widget.
  ///
  /// It has functions like, move, rotate, zoom, etc..
  MapController? flutterMapController;


  EmpriusMapController({
    this.selectedLocation,
    this.markers
  });

}


