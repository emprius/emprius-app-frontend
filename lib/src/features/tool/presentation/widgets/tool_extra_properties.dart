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

  String? _currentTime = "";
  List<String> maxTime = ["3-5 dies", "1 setmana", "2 setmanes", "1 mes"];


  @override
  void initState() {
    _currentDistance = maxDistance[0];
    _currentWeight = averageWeight[0];
    _currentTime = maxTime[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("Distancia maxima"),
           DropdownButton(

              value: _currentDistance,
              items: maxDistance
                  .map(
                    (String value) => DropdownMenuItem<String>(

                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              onChanged: (String? value) {
                if (value != null && _currentDistance != value) {
                  setState(() {
                    _currentDistance = value
                        .toString(); //you can use this variable while submitting your form.
                  });
                }
              },
            ),
        ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Text("Rang de pes"),
          DropdownButton(

            value: _currentWeight,
            items: averageWeight
                .map(
                  (String weight) => DropdownMenuItem<String>(
                value: weight,
                child: Text(weight),
              ),
            )
                .toList(),
            onChanged: (String? weight) {
              if (weight != null && _currentWeight != weight) {
                setState(() {
                  _currentWeight = weight
                      .toString(); //you can use this variable while submitting your form.
                });
              }
            },
          ),
        ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Temps maxim"),
              DropdownButton(

                value: _currentTime,
                items: maxTime
                    .map(
                      (String time) => DropdownMenuItem<String>(
                    value: time,
                    child: Text(time),
                  ),
                )
                    .toList(),
                onChanged: (String? time) {
                  if (time != null && _currentTime != time) {
                    setState(() {
                      _currentWeight = time
                          .toString(); //you can use this variable while submitting your form.
                    });
                  }
                },
              ),
            ]),
      ]),
    );
  }
}
