import 'package:empriusapp/src/core/helper/utils/map_validator.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_marker.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/marker_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';


/// Widget that show a flutter_map.
///
/// It can get a [controller] used for validation purposes or to extract/modify
/// selected points on the map.
///
class EmpriusMap extends StatefulWidget {
  final EmpriusMapController? empriusMapController;
  final MapValidator? mapValidator;
  final bool isViewOnly;
  final LatLng? initialCenter;

  EmpriusMap({
    Key? key,
    this.empriusMapController,
    this.mapValidator,
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
    if(widget.empriusMapController != null) {
      widget.empriusMapController!.flutterMapController = _flutterMapController;
    }

    if(widget.mapValidator !=null){
      widget.mapValidator!.refresh = _refresh;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.empriusMapController?.markers != null ) {
      markers = widget.empriusMapController!.markers!;
    }


    return Column(
      children: [
        if(widget.mapValidator?.errorMsg?.isNotEmpty ?? false)
          Text(
            widget.mapValidator!.errorMsg!,
            style: const TextStyle(color: Colors.red),
          ),
        Flexible(
          child: FlutterMap(
            mapController: _flutterMapController,
            options: MapOptions(
                center: widget.initialCenter ?? LatLng(41.695384, 2.492793),
                zoom: _defaultZoom,
                interactiveFlags:  InteractiveFlag.all,
                enableScrollWheel: true,
                onTap: (tapPos, LatLng tapLocation) {
                  if (widget.isViewOnly) return;


                  markers = [
                    CustomMarker.tapMarker(tapLocation)
                  ];
                  widget.empriusMapController?.markers = markers;
                  widget.empriusMapController?.selectedLocation = tapLocation;
                  widget.mapValidator?.selectedLocation = tapLocation;

                  setState((){});
                }
            ),
            children: [
              TileLayerWidget(
                options: TileLayerOptions(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                )),
              // MarkerLayerOptions(
              //   markers: markers,
              // ),
              PopupMarkerLayerWidget(
                options: PopupMarkerLayerOptions(
                  //popupController: _popupLayerController,
                  markers: markers,
                  //markerRotateAlignment: PopupMarkerLayerOptions.rotationAlignmentFor(AnchorAlign.top),
                  //TODO: implement popup
                  popupBuilder: (BuildContext context, Marker marker) =>
                      MarkerPopup(marker),
                ),
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
