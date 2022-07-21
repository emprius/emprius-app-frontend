import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      //todo change next file for set state imageProfile:
      final imageTemp = File(image.path);
      //final imageProfile = await saveFile(image.path);
      setState(() => _image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

/*
// dependency path provider + path:
Future<File> saveFile(String imagePath) async{
    final directory = await getApplicationDocumentDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
}*/

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 100.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Tria el teu avatar"),
            const SizedBox( height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                      }, icon: const Icon(Icons.camera),
                  tooltip: "Feste una foto",
                ),
                IconButton(
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  }, icon: const Icon(Icons.image),
                  tooltip: "Puja de la galeria",
                )
              ],
            ),
            _image != null ? Image.file(_image!) : const Text("Cap imatge seleccionada"),
          ],
        ),
      ),
    );
  }
}
