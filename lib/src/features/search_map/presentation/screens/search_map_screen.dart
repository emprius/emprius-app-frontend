import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/custom_search_bar.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/search_filters.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
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

  EmpriusMapController? controller;
  @override
  void initState() {
    // ref.read(searchProvider.notifier).search(center: ref.read(userProvider).location);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var user = ref.watch(currentUserProvider);
    var searchResults = ref.watch(searchProvider);
    var markers = searchResults.map(
            (tool) => CustomMarker.fromToolModel(tool) ).toList();
    controller = EmpriusMapController(
        markers: markers,
    );

    return Scaffold(
      appBar: UserAppbar("Mapa d'Eines"),
      drawer: const UserDrawer(),
      body: Stack(
        children: [
          EmpriusMap(
            initialCenter: user!.location,
            isViewOnly: true,
            empriusMapController: controller,
          ),
          Positioned(
            top: 10,
            right: 15,
            left: 15,
            child: CustomSearchBar(
              searchCallback: (
                  String _searchTerm,
                  CurrentFilters currentFilters) async {
              await ref.read(searchProvider.notifier).search(
                isAvailable: currentFilters.isAvailable,
                categories: currentFilters.selectedCategories,
                maxCost: currentFilters.maxCost,
                maybeFree: currentFilters.maybeFree,
                searchTerm: _searchTerm,
                center: controller!.flutterMapController?.center,
              );
            },),
            ),
        ],
      ),
    );
  }
}

