import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/search_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CustomSearchBar extends StatefulWidget {
  final Future<void> Function(String, SelectedFilters)? searchCallback;

 CustomSearchBar({
   Key? key,
   this.searchCallback
 }) : super(key: key);


  @override
  createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _searchTermCtrl = TextEditingController();
  var _currentFilters = SelectedFilters();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchTermCtrl,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: (){
              showModalBottomSheet(
                  context: context, builder: ((builder) => SearchFilters(
                callback: (SelectedFilters selectedFilters){
                    _currentFilters = selectedFilters;
              },)));
            }, icon: const Icon(Icons.menu_open_outlined),
          ),
          suffixIcon: !_isLoading
              ? IconButton(
                onPressed: () async{
                  setState((){
                    _isLoading = true;
                  });

                  await widget.searchCallback?.call(_searchTermCtrl.text, _currentFilters);

                  setState((){
                    _isLoading = false;
                  });
                },
                icon: Icon(Icons.search))
              : SpinKitCircle(
            size: 20.0,
            color: Colors.black54,
          ),


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


// class doSearch extends ConsumerWidget {
//   final _searchTermCtrl = TextEditingController();
//   EmpriusMapController? controller;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var actualCenter = controller!.flutterMapController!.center;
//
//
//     return IconButton(
//         onPressed: () async{
//           await ref.watch(searchProvider.notifier).searchTools(
//             searchTerm: _searchTermCtrl.text,
//             center: actualCenter,
//           );
//           // get filters
//           // Call notifier
//         },
//         icon: const Icon(Icons.search));
//
//   }
//
// }
