import 'package:empriusapp/src/features/search_map/application/controllers/emprius_map_controller.dart';
import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:empriusapp/src/features/search_map/presentation/widgets/search_filters.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:latlong2/latlong.dart';



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
  List<ToolModel> tools = _sampleTools;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
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
                hintText: "Cerca eines",
            ),
            //onChanged: searchTerm,
          ),
        ),
        // Expanded(
        //     child: ListView.builder(
        //       itemCount: tools.length,
        //         itemBuilder: (context, index){
        //         final tool = tools[index];
        //         //var image = tool.images![0];
        //         return ListTile(
        //           //leading: Image.file(tool.image),
        //           title: Text(tool.title),
        //         );
        //         },
        //     ),
        // )
      ],
    );
  }
}
//
//
// void searchTerm(String query){
// final suggestions = allTools.where()
// }

final _toolImagesPhone = [
  '/data/user/0/com.example.empriusapp/cache/image_picker290442785517590.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker3004196561469944603.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker130200792494777690.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker5889187328360687785.jpg'
];

var _sampleTools = [
  ToolModel(
      id: 1,
      isAvailable: true,
      title: "Bici de paseig",
      description: "No va be per a pujades fortes pero pots dur coses al cistell",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.VEHICLE,
      transportOptions: TransportOptions.NOT_NECESSARY,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.765626, 2.407599)),
  ToolModel(
      id: 2,
      isAvailable: true,
      title: "Burra autonoma",
      description: "Sha fet servir per raves pero encara te molta potencia.",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.ENERGY,
      transportOptions: TransportOptions.NECESSARY,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.692915, 2.540445)),
  ToolModel(
      id: 3,
      isAvailable: true,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.GARDENING,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.765964, 2.350709)),
  ToolModel(
      id: 3,
      isAvailable: false,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.GARDENING,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.647657, 2.469107)),
  ToolModel(
      id: 3,
      isAvailable: false,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.WOODWORK,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.738964, 2.498198)),
];
