import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchBar extends StatefulWidget {
 CustomSearchBar({
   Key? key,
   //this.controller,
 }) : super(key: key);

 //final TextEditingController controller;

  @override
  createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _searchTermCtrl = TextEditingController();
  EmpriusMapController? controller;

  // @override
  // void dispose() {
  //   _searchTermCtrl.dispose()
  //   super.dispose();
  // }
  //

  // @override
  // void initState() {
  //   super.initState();
  //   widget.controller((){
  //     setState((){
  //
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return TextField(
      onChanged: searchTerm,
      controller: _searchTermCtrl,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: filterOptions(),
          suffixIcon: doSearch(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "Cerca eines"
      ),
    );
  }
}


void searchTerm(String query) {

}


  class doSearch extends ConsumerWidget {
  final _searchTermCtrl = TextEditingController();
  EmpriusMapController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var actualCenter = controller!.flutterMapController!.center;


    return IconButton(
        onPressed: () async{
          await ref.watch(searchProvider.notifier).searchTools(
            searchTerm: _searchTermCtrl.text,
            center: actualCenter,
          );
          // get filters
          // Call notifier
        },
        icon: const Icon(Icons.search));

  }

}

IconButton filterOptions() {
  return IconButton(
      onPressed: (){
        // showModalBottomSheet(
        //     context: context, builder: ((builder) => SearchFilters()));
      },
      icon: const Icon(Icons.menu_open_outlined));
}
