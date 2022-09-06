import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
 CustomSearchBar({
   Key? key,
   //this.controller,
 }) : super(key: key);

 //final TextEditingController controller;

  @override
  createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {

  final _searchTermCtrl = TextEditingController();

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


IconButton doSearch() {
  return IconButton(
      onPressed: () async {

        //await ref
        //    .read(searchProvider.notifier).searchTools();
        // get filters
        // get searrch term:
        //searchTerm: _searchTermCtrl.text,
        // Get center of map
        //var actualCenter = controller!.flutterMapController!.center;
        // Call notifier
      },
      icon: const Icon(Icons.search));

}

IconButton filterOptions() {
  return IconButton(
      onPressed: (){
        // showModalBottomSheet(
        //     context: context, builder: ((builder) => SearchFilters()));
      },
      icon: const Icon(Icons.menu_open_outlined));
}
