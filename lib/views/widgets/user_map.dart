import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class UserMap extends StatefulWidget {
  const UserMap({Key? key}) : super(key: key);

  @override
  State<UserMap> createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  //var marker = <Marker>[];
  List<Marker> markers = [];

  //late final MapController mapController;

/*  @override
  void initState(){
    super.initState();
    mapController = MapController();
  }*/

/*
  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      //mapController: mapController,
      options: MapOptions(
        center: LatLng(41.695384, 2.492793),
        zoom: 15.0,
        interactiveFlags:  InteractiveFlag.all,
          enableScrollWheel: true,
        // todo: CHECK ON LONG PRESS PASS NEW LOCATION

          onTap: (tapPos, LatLng tapLocation) {
          markers = [];
         /* markers.add(
            Marker(
              point: tapLocation,
              builder: (ctx) => const Icon(Icons.location_pin),
            ),
          );*/
          //print(tapLocation.toString());
          setState((){
            markers.clear();
            markers.add(
              Marker(
                point: tapLocation,
                builder: (ctx) => const Icon(Icons.location_pin),
              ),
            );
          });
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
