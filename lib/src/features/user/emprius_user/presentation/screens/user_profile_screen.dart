import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/constants/widget_spacing.dart';
import 'package:empriusapp/src/features/activity/presentation/widgets/user_activity_barchart.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_marker.dart';
import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/core/config/routes.dart';
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
    var kk = ref.read(currentUserProvider.notifier).state;
    _setMarkers(ref.read(currentUserProvider.notifier).state!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(currentUserProvider)!;
    ref.listen<LatLng>(currentUserProvider.select(
            (user) => user!.location!), (LatLng? previous, LatLng next) {
      _setMarkers(user);
      _customMapCtrl.flutterMapController?.move(next, 15.0);
    });
    const double padding = 10;

    return Scaffold(
      appBar: UserAppbar("El meu perfil"),
      drawer: const UserDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Editar perfil",
        child: const Icon(Icons.edit),
        onPressed: () async {
          await Navigator.pushNamed(context, editProfileScreenRoute,
              arguments: EditProfileArguments(user));
        },
      ),
      body: ListView(
        children:
        [Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: UserProfileAvatar(
                      avatar: user.avatar!.isEmpty ? defaultAvatar : user.avatar!,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    buildName(user),
                    addVerticalSpace(6.0),
                    RatingStars(rating: user.rating!),
                    addVerticalSpace(6.0),
                    Text('EMPS: ${user.emps}', style: Theme.of(context).textTheme.bodyText2,),
                  ]),
                  addHorizontalSpace(6.0),
                  CustomTextButton(
                      text: "LES MEVES EINES",
                      onClicked: () {
                        Navigator.pushNamed(context, userToolsScreenRoute);
                      }),
                /*  Column(children: [
                    Switch(
                        value: user.isActive!,
                        activeTrackColor: Colors.white10,
                        activeColor: Colors.blue,
                        onChanged: null,  // Deactivate the switch
                    ),
                    const SizedBox(height: 6.0),
                    Text(user.isActive! ? "Perfil actiu" : "Perfil inactiu"),
                  ]),*/
                ]),
              ),
              addVerticalSpace(8.0),
              Divider(),
              addVerticalSpace(8.0),
              buildLocation(user),
              addVerticalSpace(8.0),
              buildStatistics(user),
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildName(UserModel user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name!,
            style: Theme.of(context).textTheme.headline2,
            ),
          addVerticalSpace(4.0),
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      );

  Widget buildLocation(UserModel user) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Localitzacio actual:', style: Theme.of(context).textTheme.bodyMedium,),
          addVerticalSpace(4.0),
          Container(
            width: 300,
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: EmpriusMap(empriusMapController: _customMapCtrl, isViewOnly: true, initialCenter: user.location,),
          ),
        ],
      );

  Widget buildStatistics(UserModel user) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Resum activitat:', style: Theme.of(context).textTheme.bodyMedium,),
          addVerticalSpace(4.0),
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      width: 500,
                      height: 300,
                      padding: const EdgeInsets.all(8),
                      //clipBehavior: Clip.hardEdge,
                      child: ActivityBarchart()
                  )]),
          ),
        ],
      );
}
