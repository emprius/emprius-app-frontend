import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
      onPressed: () {
        // get filters
        // get searrch term
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
