import 'package:empriusapp/providers/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class UserMapController {
  LatLng? selectedLocation;
  List<Marker>? markers;

  String errorMsg = "";

  UserMapController(
      {this.selectedLocation,
        this.markers});

  String? selectedPositionValidator(String? value) {
    if (selectedLocation != null) return null;

    return Constants.emptyInvitationError;
  }
}

class UserMap extends StatefulWidget {
  final UserMapController? controller;

  const UserMap({Key? key, this.controller}) : super(key: key);

  @override
  _UserMapState createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  late List<Marker> markers;
  late final MapController mapController;

  @override
  initState() {
    if(widget.controller != null) {
      markers = widget.controller?.markers ?? [];
      // widget.controller!.markers! = markers;
    }
  }

  @override
  Widget build(BuildContext context) {

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
          center: LatLng(41.695384, 2.492793),
          zoom: 15.0,
          interactiveFlags:  InteractiveFlag.all,
          enableScrollWheel: true,
          onTap: (tapPos, LatLng tapLocation) {
            // ref.watch(userMapProvider.notifier).update([tapLocation]);
            //markers = [];
            setState((){
              markers.clear();
              markers.add(
                Marker(
                  point: tapLocation,
                  builder: (ctx) => const Icon(Icons.location_pin),
                ),
              );
            });

            widget.controller?.selectedLocation = tapLocation;
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
    );
  }
}
