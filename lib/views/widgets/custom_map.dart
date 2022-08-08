import 'package:empriusapp/providers/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../utils/constants.dart';
import 'common/user_marker.dart';


/// Controller for [EmpriusMap] widget
class EmpriusMapController {

  /// Selected location on the map onTap.
  ///
  /// Disabled if empriusMap [isViewOnly] is true.
  LatLng? selectedLocation;

  /// List of Markers to paint or already painted on the map
  List<Marker>? markers;

  /// Function that basically run setState on the widget
  Function()? refresh;

  /// Controller used to control the inner flutter_map widget.
  ///
  /// It has functions like, move, rotate, zoom, etc..
  MapController? flutterMapController;

  /// Function to run when [validate] function is called.
  ///
  /// Should return null if no error or a error message string
  /// if error.
  ///
  /// It pass selected position when onTap
  String? Function(LatLng? value)? validator;

  /// Error mesage to show when validate function fails
  String? _errorMsg;

  get errorMsg => _errorMsg;

  EmpriusMapController({
    this.selectedLocation,
    this.validator,
    this.markers
  });

  /// Run the validator and return true if validator is not null
  bool validate() {
    if(validator != null) {
      var res = validator!(selectedLocation);
      _errorMsg = res;
      if (refresh != null) refresh!();
      if (res == null) {
        return true;
      }
      return false;
    } else {
      return true;
    }
  }
}

/// Widget that show a flutter_map.
///
/// It can get a [controller] used for validation purposes or to extract/modify
/// selected points on the map.
class EmpriusMap extends StatefulWidget {
  final EmpriusMapController? controller;
  final bool isViewOnly;


  final LatLng? initialCenter;

  EmpriusMap({
    Key? key,
    this.controller,
    this.isViewOnly = false,
    this.initialCenter
  }) : super(key: key);

  @override
  _EmpriusMapState createState() => _EmpriusMapState();
}

class _EmpriusMapState extends State<EmpriusMap> {
  late List<Marker> markers = [];
  MapController _flutterMapController = MapController();

  void _refresh() => setState((){});

  double _defaultZoom = 15.0;

  @override
  initState() {
    if(widget.controller != null) {
      widget.controller!.refresh = _refresh;
      widget.controller!.flutterMapController = _flutterMapController;
    }
  }

  @override
  Widget build(BuildContext context) {

    if(widget.controller?.markers != null ) {
      markers = widget.controller!.markers!;
      // mapController.move(widget.controller!.markers!.first.point, _defaultZoom);
    }

    return Column(
      children: [
        if(widget.controller?.errorMsg?.isNotEmpty ?? false)
          Text(
            widget.controller!.errorMsg!,
            style: const TextStyle(color: Colors.red),
          ),
        Flexible(
          child: FlutterMap(
            mapController: _flutterMapController,
            options: MapOptions(
              //TODO: ADD DYNAMIC CENTER
                center: widget.initialCenter ?? LatLng(41.695384, 2.492793),
                zoom: _defaultZoom,
                interactiveFlags:  InteractiveFlag.all,
                enableScrollWheel: true,
                onTap: (tapPos, LatLng tapLocation) {
                  if (widget.isViewOnly) return;
                  markers = [
                    Marker(
                        point: tapLocation,
                        builder: (ctx) => UserMarker(
                            const Icon(Icons.pin_drop_sharp)
                        )
                    ),
                  ];
                  widget.controller?.markers = markers;
                  widget.controller?.selectedLocation = tapLocation;

                  setState((){});
                }
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
              MarkerLayerOptions(
                markers: markers,
              ),
            ],
            /*nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: null,
              ),
            ],*/
          ),
        ),
      ],
    );
  }
}
