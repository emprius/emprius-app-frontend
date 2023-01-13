import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SingleImageSelector extends StatefulWidget {
  final Function(File?) callback;
  SingleImageSelector(this.callback, {Key? key}) : super(key: key);

  @override
  State<SingleImageSelector> createState() => _SingleImageSelectorState();
}

class _SingleImageSelectorState extends State<SingleImageSelector> {
  File? _image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);
      widget.callback(imageTemp);

    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: const EdgeInsets.symmetric(
        //horizontal: 50,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Tria el teu avatar:"),
            const SizedBox( height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 40.0,
                  color: Colors.blueAccent,
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  }, icon: const Icon(Icons.camera),
                  tooltip: "Feste una foto",
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  iconSize: 40.0,
                  color: Colors.blueAccent,
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  }, icon: const Icon(Icons.image),
                  tooltip: "Puja de la galeria",
                )
              ],
            ),
            _image != null
                ? Image.file(_image!)
                : const Text("Cap imatge seleccionada"),
          ],
        ),
      ),
    );
  }
}

