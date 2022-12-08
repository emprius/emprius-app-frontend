import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/helper/utils/asset_or_file_image.dart';
import 'package:empriusapp/src/features/tool/presentation/widgets/tool_caroussel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageListSelector extends StatefulWidget {
  final Function(List<String>?)? callback;
  final String text;
  final List<String>? toolImageList;

  ImageListSelector({
    this.text = 'Pujar imatges',
    this.toolImageList = const [],
    this.callback, Key? key}) : super(key: key);

  @override
  State<ImageListSelector> createState() => _ImageListSelectorState();
}

class _ImageListSelectorState extends State<ImageListSelector> {

  final ImagePicker imagePicker = ImagePicker();

  // List<XFile>? toolImageList = [];
  late List<String>? toolImageList;

  @override
  void initState() {
    toolImageList = widget.toolImageList;
    super.initState();
  }

  void selectToolImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (widget.callback == null) return;
    if (selectedImages!.isNotEmpty) {
      toolImageList = [...selectedImages.map((e) => e.path)];
      widget.callback!(toolImageList);
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CustomTextButton(
            text: widget.text,
            onClicked: () { selectToolImages(); },
          ),
          if(toolImageList?.isNotEmpty ?? false)
            ToolCaroussel(toolImageList!),
        ],
    );
  }
}
