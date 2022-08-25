import 'package:flutter/material.dart';

class ToolExtraProperties extends StatefulWidget {
  const ToolExtraProperties({Key? key}) : super(key: key);

  @override
  State<ToolExtraProperties> createState() => _ToolExtraPropertiesState();
}

class _ToolExtraPropertiesState extends State<ToolExtraProperties> {
  String? _currentDistance = "";
  List<String> maxDistance = ["0-10Km", "10-30Km", "30-50Km", "+50Km"];

  String? _currentWeight = "";
  List<String> averageWeight = ["0-10Kg", "10-30Kg", "30-50Kg", "+50Kg"];

  @override
  void initState() {
    _currentDistance = maxDistance[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        Row(children: [
          Text("Distancia maxima"),
          DropdownButton(
            value: _currentDistance,
            items: maxDistance
                .map(
                  (String _value) => DropdownMenuItem<String>(
                    value: _value,
                    child: Text(_value),
                  ),
                )
                .toList(),
            onChanged: (String? _value) {
              if (_value != null && _currentDistance != _value) {
                setState(() {
                  _currentDistance = _value
                      .toString(); //you can use this variable while submitting your form.
                });
              }
            },
          ),
        ]),
        // Row(children: [
        //   Text("Rang de pes"),
        //   DropdownButton(
        //     value: _currentWeight,
        //     items: averageWeight
        //         .map(
        //           (String weight) => DropdownMenuItem<String>(
        //         value: weight,
        //         child: Text(weight),
        //       ),
        //     )
        //         .toList(),
        //     onChanged: (String? weight) {
        //       if (weight != null && _currentWeight != weight) {
        //         setState(() {
        //           _currentWeight = weight
        //               .toString(); //you can use this variable while submitting your form.
        //         });
        //       }
        //     },
        //   ),
        // ]),
      ]),
    );
  }
}
