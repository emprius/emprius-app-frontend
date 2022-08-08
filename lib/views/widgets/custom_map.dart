import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../controllers/emprius_map_controller.dart';
import 'common/user_marker.dart';


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
