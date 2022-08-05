import 'package:empriusapp/providers/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../utils/constants.dart';

class CustomMapController {
  LatLng? selectedLocation;
  List<Marker>? markers;
  Function()? refresh;
  MapController? flutterMapController;

  /// Function to run when use validate function.
  String? Function(LatLng? value)? validator;
  String? errorMsg;

  CustomMapController(
      {this.selectedLocation,
        this.validator,
        this.markers});

  /// Run the validator and return true if validator is not null
  bool validate() {
    var res = validator!(selectedLocation);
    errorMsg = res;
    if (refresh != null) refresh!();
    if (res == null) {
      return true;
    }
    return false;
  }
}

class CustomMap extends StatefulWidget {
  final CustomMapController? controller;
  final bool isViewOnly;

  const CustomMap({Key? key, this.controller, this.isViewOnly = false}) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late List<Marker> markers = [];
  MapController _mapController = MapController();

  void _refresh() => setState((){});

  double _defaultZoom = 15.0;

  @override
  initState() {
    if(widget.controller != null) {
      widget.controller!.refresh = _refresh;
      widget.controller!.flutterMapController = _mapController;
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
            mapController: _mapController,
            options: MapOptions(
              //TODO: ADD DYNAMIC CENTER
                center: widget.controller?.markers?.first.point ?? LatLng(41.695384, 2.492793),
                zoom: _defaultZoom,
                interactiveFlags:  InteractiveFlag.all,
                enableScrollWheel: true,
                onTap: (tapPos, LatLng tapLocation) {
                  if (widget.isViewOnly) return;

                  markers = [
                    Marker(
                      point: tapLocation,
                      builder: (ctx) => const Icon(Icons.location_pin),
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
