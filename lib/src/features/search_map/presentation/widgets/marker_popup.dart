import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/utils/asset_or_file_image.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter/material.dart';

typedef PopupCallback = void Function(BuildContext context)?;

class MarkerPopup extends StatefulWidget {
  final String? title;
  final String? description;
  final double? rating;
  final String? image;
  final bool? isAvailable;
  PopupCallback onClick;

  MarkerPopup(
      {Key? key,
      this.title,
      this.description,
      this.rating,
      this.image,
      this.isAvailable,
      this.onClick})
      : super(key: key);

  MarkerPopup.fromToolModel(ToolModel tool)
      : title = tool.title,
        description = tool.description,
        image = tool.images![0],
        isAvailable = tool.isAvailable,
        rating = tool.rating {
    onClick = (BuildContext context) {
      Navigator.pushNamed(context, toolDetailScreenRoute,
          arguments: ToolDetailArguments(tool.id!));
    };
  }

  @override
  createState() => _MarkerPopupState();
}

class _MarkerPopupState extends State<MarkerPopup> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => widget.onClick?.call(context),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 100.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: assetOrFileImage(widget.image!),
                          fit: BoxFit.cover)),
                ),
                RatingStars(rating: widget.rating!),
                Text(
                  widget.title!,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
                Padding(padding: const EdgeInsets.all(4.0),
                    child: widget.isAvailable!
                        ? null
                        : const Text("NO DISPONIBLE",
                      style: TextStyle(fontSize: 10.0),
                    ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(widget.description!,
                          style: const TextStyle(fontSize: 12.0),
                        )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
