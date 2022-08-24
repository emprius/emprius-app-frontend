import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageListSelector extends StatefulWidget {
  const ImageListSelector({Key? key}) : super(key: key);

  @override
  State<ImageListSelector> createState() => _ImageListSelectorState();
}

class _ImageListSelectorState extends State<ImageListSelector> {

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? toolImageList = [];

  void selectToolImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      toolImageList!.addAll(selectedImages);
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextButton(
            text: 'Pujar imatges',
            onClicked: () { selectToolImages(); },
          ),
          SizedBox(height: 10.0),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: toolImageList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(File(toolImageList![index].path), fit: BoxFit.cover);
                }

            ),
          )
        ],
      ),
    );
  }
}
