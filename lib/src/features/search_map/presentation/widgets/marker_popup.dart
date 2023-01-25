import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/utils/asset_or_file_image.dart';
import 'package:empriusapp/src/core/helper/utils/widget_spacing.dart';
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
    const double padding = 8;

    return Container(
      width: 300,
      child: Card(
        elevation: 2.0,
        child: InkWell(
          onTap: () => widget.onClick?.call(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: padding, horizontal: padding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  isThreeLine: true,
                  leading: SizedBox(
                    width: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                      image: assetOrFileImage(widget.image!),
                    ),),
                  ),
                  title: Text(widget.title!),
                  subtitle: Text(widget.description!, style: Theme.of(context).textTheme.caption),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingStars(rating: widget.rating!),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: padding),
                       child: widget.isAvailable!
                         ? null
                         : const Text("NO DISPONIBLE"),
                     )
                    ],),
                ),
              ],),
          ),
          ),
      ),
    );
  }
}


