import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MarkerPopup extends StatefulWidget {
  const MarkerPopup(this.marker, {Key? key}) : super(key: key);
  final Marker marker;

  @override
  State<MarkerPopup> createState() => _MarkerPopupState();
}

class _MarkerPopupState extends State<MarkerPopup> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => setState(() {
          //_currentIcon = (_currentIcon + 1) % _icons.length;
        }),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 10),
            //   child: Icon(_icons[_currentIcon]),
            // ),
            _cardDescription(context),
          ],
        ),
      ),
    );
  }
}

Widget _cardDescription(BuildContext context){
  return Padding(
    padding: EdgeInsets.all(10),
  child: Container(
    constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text(
          'Popup for a marker!',
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
        Text(
          'Position: ${widget.marker.point.latitude}, ${widget.marker.point.longitude}',
          style: const TextStyle(fontSize: 12.0),
        ),
        Text(
          'Marker size: ${widget.marker.width}, ${widget.marker.height}',
          style: const TextStyle(fontSize: 12.0),
        ),
      ],
    ),
  ),
  );
}
