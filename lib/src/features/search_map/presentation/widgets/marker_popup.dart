import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter/material.dart';

typedef PopupCallback = void Function(BuildContext context)?;

class MarkerPopup extends StatefulWidget {
  final String? title;
  final String? description;
  final int? rating;
  final String? image;
  PopupCallback onClick;

  MarkerPopup(
      {Key? key, this.title, this.description, this.rating, this.image, this.onClick})
      : super(key: key);

  MarkerPopup.fromToolModel(ToolModel tool)
      : title = tool.title,
        description = tool.description,
  image = tool.images![0],
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
      child: Row(
          mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
            Container(
            alignment: Alignment.bottomCenter,
              //constraints: BoxConstraints(minWidth: 20, maxWidth: 50),
              // width: 50.0,
              // height: 50.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(File(widget.image!)),
                      fit: BoxFit.cover)),),
            //   CircleAvatar(
            //   radius: 40,
            //   backgroundColor: Colors.transparent,
            //   backgroundImage: widget.image as ImageProvider,
            // ),
                RatingStars(rating: widget.rating!),
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
    );
  }
}
