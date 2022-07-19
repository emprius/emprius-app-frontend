import 'package:empriusapp/views/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("El meu perfil")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/sharing.png"),
                    radius: 40,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: const Icon(
                      Icons.camera_alt_rounded,
                    ),
                  )
                ],
              ),
              const Text(
                "Mayu",
                style: TextStyle(fontSize: 25),
              ),
              const Text("mail@mai.com"),
              Container(
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: const Text("Localitzacio"),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blueGrey, width: 1),
                    primary: Colors.black26,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: const Text("Editar Perfil"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bottomSheet() {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: const UserImagePicker()
    );
  }
}
