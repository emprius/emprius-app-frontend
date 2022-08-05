import 'package:empriusapp/providers/user_provider.dart';
import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/views/widgets/common/custom_marker.dart';
import 'package:empriusapp/views/widgets/common/custom_text_button.dart';
import 'package:empriusapp/views/widgets/common/rating_stars.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:empriusapp/views/widgets/user_drawer.dart';
import 'package:empriusapp/views/widgets/custom_map.dart';
import 'package:empriusapp/views/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user_model.dart';
import '../../utils/constants.dart';
import 'package:latlong2/latlong.dart';


class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfileScreen> {
  final _customMapCtrl = CustomMapController();

  void _setMarkers(LatLng newLatLng){
    _customMapCtrl.markers = [
      Marker(
        point: newLatLng,
        builder: (ctx) => UserMarker(const Icon(Icons.location_pin)),
      ),];
  }

  @override
  void initState() {
    _setMarkers( ref.read(userProvider.notifier).state.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);

    //TODO STUDY:
    ref.listen<LatLng>(userProvider.select(
            (user) => user.location), (LatLng? previous, LatLng next) {
      _setMarkers(next);
      _customMapCtrl.flutterMapController?.move(next, 15.0);
    });

    return Scaffold(
      appBar: UserAppbar("El meu perfil"),
      drawer: UserDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Editar perfil",
        child: const Icon(Icons.edit),
        onPressed: () async {
          await Navigator.pushNamed(context, editProfileScreenRoute,
              arguments: EditProfileArguments(user));
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ProfileImage(
                    showBadge: true,
                    badgeIcon: Icons.camera_alt,
                    avatar: user.avatar.isEmpty ? defaultAvatar : user.avatar,
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  buildName(user),
                  const SizedBox(height: 6.0),
                  RatingStars(rating: user.rating),
                  const SizedBox(height: 6.0),
                  Text('EMPS: ${user.emps}'),
                ]),
                const SizedBox(width: 6.0),
                Column(children: [
                  Switch(
                      value: user.isActive,
                      activeTrackColor: Colors.white10,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        ref.watch(userProvider.notifier).updateUser(user.copy(isActive: value));
                      }),
                  const SizedBox(height: 6.0),
                  Text(user.isActive ? "Perfil actiu" : "Perfil inactiu"),
                ]),
              ]),
              const SizedBox(height: 20.0),
              buildLocation(user),
              const SizedBox(height: 10.0),
              CustomTextButton(
                  text: "Les meves eines",
                  onClicked: () {
                    Navigator.pushNamed(context, userToolsScreenRoute);
                  }),
              const SizedBox(height: 10.0),
              buildStatistics(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(UserModel user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildLocation(UserModel user) => Column(
        children: [
          const Text('Localitzacio actual:'),
          const SizedBox(height: 6.0),
          Container(
            width: 300,
            height: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CustomMap(controller: _customMapCtrl, isViewOnly: true),
          ),
        ],
      );

  Widget buildStatistics(UserModel user) => Column(
        children: [
          const Text('La meva activitat:'),
          const SizedBox(height: 6.0),
          Container(
            width: 300,
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      );
}
