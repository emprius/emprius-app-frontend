import 'package:empriusapp/providers/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';


class UserMap extends ConsumerStatefulWidget {
  const UserMap({Key? key}) : super(key: key);

  @override
  createState() => _UserMapState();
}

class _UserMapState extends ConsumerState<UserMap> {
  //List<Marker> markers = [];
  late final MapController mapController;

  @override
  Widget build(BuildContext context) {
    var markers = ref.watch(userMapProvider).map((e) => Marker(
      point: e,
      builder: (ctx) => const Icon(Icons.location_pin),
    ),
    ).toList();


    return FlutterMap(
      //mapController: mapController,
      options: MapOptions(
        center: LatLng(41.695384, 2.492793),
        zoom: 15.0,
        interactiveFlags:  InteractiveFlag.all,
          enableScrollWheel: true,
          onTap: (tapPos, LatLng tapLocation) {
          ref.watch(userMapProvider.notifier).update([tapLocation]);
          /*//markers = [];
          setState((){
            markers.clear();
            markers.add(
              Marker(
                point: tapLocation,
                builder: (ctx) => const Icon(Icons.location_pin),
              ),
            );*/
        /*  }
          )*/
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
