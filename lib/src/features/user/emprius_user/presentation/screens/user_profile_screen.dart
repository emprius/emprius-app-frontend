import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_marker.dart';
import 'package:empriusapp/src/core/helper/utils/constants.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';


class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfileScreen> {
  final _customMapCtrl = EmpriusMapController();

  void _setMarkers(UserModel user){
    _customMapCtrl.markers = [
      CustomMarker.fromUserModel(user)
    ];
  }

  @override
  void initState() {
    _setMarkers(ref.read(userProvider.notifier).state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);
    ref.listen<LatLng>(userProvider.select(
            (user) => user.location!), (LatLng? previous, LatLng next) {
      _setMarkers(user);
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
                  child: UserProfileAvatar(
                    avatar: user.avatar!.isEmpty ? defaultAvatar : user.avatar!,
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  buildName(user),
                  const SizedBox(height: 6.0),
                  RatingStars(rating: user.rating!),
                  const SizedBox(height: 6.0),
                  Text('EMPS: ${user.emps}'),
                ]),
                const SizedBox(width: 6.0),
                Column(children: [
                  Switch(
                      value: user.isActive!,
                      activeTrackColor: Colors.white10,
                      activeColor: Colors.blue,
                      onChanged: null,  // Deactivate the switch
                  ),
                  const SizedBox(height: 6.0),
                  Text(user.isActive! ? "Perfil actiu" : "Perfil inactiu"),
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
            user.name!,
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
            child: EmpriusMap(empriusMapController: _customMapCtrl, isViewOnly: true, initialCenter: user.location,),
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
