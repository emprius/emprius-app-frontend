import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:empriusapp/views/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfileScreen> {
/*
  @override
  void initState() {
    super.initState();
  }
*/

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);

    return Scaffold(
      appBar: const UserAppbar(),
      body: Padding(
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
                        builder: ((builder) => const UserImagePicker()),
                      );
                    },
                    child: const Icon(
                      Icons.camera_alt_rounded,
                    ),
                  )
                ],
              ),
              Text(
                user.name,
                style: const TextStyle(fontSize: 25),
              ),
             Text(user.email),
              const SizedBox(height: 20.0),
              Container(
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Text(user.location),
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
    );
  }
}
