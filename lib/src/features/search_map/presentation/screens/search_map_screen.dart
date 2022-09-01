import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_search_bar.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/search_filters.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchMapScreen extends ConsumerStatefulWidget {
  const SearchMapScreen({Key? key}) : super(key: key);

  @override
  createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends ConsumerState<SearchMapScreen> {
  @override
  void initState() {
    ref.read(searchProvider.notifier).searchTools(center: ref.read(userProvider).location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);


    var searchResults = ref.watch(searchProvider);
    var controller = EmpriusMapController(
        markers: searchResults.map((tool) => CustomMarker.fromToolModel(tool)).toList()
    );


    return Scaffold(
      appBar: UserAppbar("Mapa d'Eines"),
      drawer: UserDrawer(),
      floatingActionButton: CustomTextButton(
          text: 'Filtres',
          onClicked: () {
            showModalBottomSheet(
                context: context, builder: ((builder) => SearchFilters()));
          }),
      body: Stack(
        fit: StackFit.expand,
        children: [
          EmpriusMap(
            initialCenter: user.location,
            isViewOnly: true,
            empriusMapController: controller,
          ),
          CustomSearchbar(),
        ],
      ),
    );
  }
}
