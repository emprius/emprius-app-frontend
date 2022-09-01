import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/features/search/presentation/widgets/custom_search_bar.dart';
import 'package:empriusapp/src/features/search/presentation/widgets/emprius_map.dart';
import 'package:empriusapp/src/features/search/presentation/widgets/search_filters.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchMapScreen extends ConsumerStatefulWidget {
  const SearchMapScreen({Key? key}) : super(key: key);

  @override
  createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends ConsumerState<SearchMapScreen> {
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userProvider);

    return Scaffold(
      appBar: UserAppbar("Home"),
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
          ),
          CustomSearchbar(),
        ],
      ),
    );
  }
}
