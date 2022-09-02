import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter/material.dart';

typedef PopupCallback = void Function(BuildContext context)?;

class MarkerPopup extends StatefulWidget {
  final String? title;
  final String? description;
  final int? rating;
  //final String? image;
  PopupCallback onClick;

  MarkerPopup(
      {Key? key, this.title, this.description, this.rating, this.onClick})
      : super(key: key);

  MarkerPopup.fromToolModel(ToolModel tool)
      : title = tool.title,
        description = tool.description,
        rating = tool.rating {
    onClick = (BuildContext context) {
      Navigator.pushReplacementNamed(context, toolDetailScreenRoute);
    };
  }

  @override
  State<MarkerPopup> createState() => _MarkerPopupState();
}

class _MarkerPopupState extends State<MarkerPopup> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.title!,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                  Text(
                    widget.description!,
                    //'Position: ${widget.marker.point.latitude}, ${widget.marker.point.longitude}',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
