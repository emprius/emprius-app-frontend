import 'package:latlong2/latlong.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';

final _toolImagesPhone = [
  '/data/user/0/com.example.empriusapp/cache/image_picker4801801919904609723.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker8754154934436486707.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker5039266792256567929.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker6463638125453935552.jpg'
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
      images: _toolImagesPhone,
      location: LatLng(41.795394, 2.792793)),
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
      images: _toolImagesPhone,
      location: LatLng(41.995386, 2.492793)),
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
      images: _toolImagesPhone,
      location: LatLng(41.695386, 2.992756)),
];

// search tools DTO:

class SearchHttpRepository {
  String get path => "/tools/search";

  Future<List<ToolModel>> searchTools({
   String? searchTerm,
   LatLng? center,
   List<ToolCategory>? categories,
   int? maxCost,
   bool? maybeFree,
    int? availableFrom
}) async {
    return _sampleTools;
  }
}

/////another way:

//
// class ToolList {
//   final List<ToolModel> tools;
//   ToolList(this.tools);
// }
//
// class SearchService {
//   static const String path = "/tools/search";
//   SearchService();
// }
//
// //import 'package:http/http.dart' as http;
//
//   Future<ToolList> getToolList() async {
//     // TODO: send additional info to be able to access protected endpoint
//     final http.Response response = await http.get(path);
//     if (response.statusCode == 200) {
//       final List<Object> decodedJsonList = jsonDecode(response.body);
//       final List<ToolDTO> tools = List<ToolDTO>.from(
//           decodedJsonList.map((json) => ToolDTO.fromJson(json)));
//       return ToolList(tools
//           .map((ToolDTO toolDTO) => ToolModel(
//           id: toolDTO.id,
//           name: toolDTO.name,
//           description: toolDTO.description,
//           url: toolDTO.url))
//           .toList());
//     }
//     throw Exception('Could not get the wishlist');
//   }