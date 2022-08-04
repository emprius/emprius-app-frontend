import 'package:empriusapp/providers/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../utils/constants.dart';

class UserMapController {
  LatLng? selectedLocation;
  List<Marker>? markers;

  Function()? refresh;

  /// Function to run when use validate function.
  String? Function(LatLng? value)? validator;
  String? errorMsg;

  UserMapController(
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

class UserMap extends StatefulWidget {
  final UserMapController? controller;
  final bool isViewOnly;

  const UserMap({Key? key, this.controller, this.isViewOnly = false}) : super(key: key);

  @override
  _UserMapState createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  late List<Marker> markers = [];
  MapController mapController = MapController();

  void _refresh() => setState((){});

  @override
  initState() {
    if(widget.controller != null) {
      markers = widget.controller?.markers ?? [];// widget.controller!.markers! = markers;
      widget.controller!.refresh = _refresh;
    }
    //mapController = widget.controller;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        if(widget.controller?.errorMsg?.isNotEmpty ?? false)
          Text(widget.controller!.errorMsg!, style: TextStyle(color: Colors.red),),
        Flexible(
          child: FlutterMap(
            mapController: mapController,

            options: MapOptions(

                center: LatLng(41.695384, 2.492793),
                zoom: 15.0,
                interactiveFlags:  InteractiveFlag.all,
                enableScrollWheel: true,
                onTap: (tapPos, LatLng tapLocation) {
                  if (widget.isViewOnly) {
                    return;
                  }
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
          ),
        ),
      ],
    );
  }
}
