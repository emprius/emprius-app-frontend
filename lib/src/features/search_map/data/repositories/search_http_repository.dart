import 'package:latlong2/latlong.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';

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
      id: 4,
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
      id: 5,
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
    await Future.delayed(Duration(seconds: 2));

    return _sampleTools;
  }
}

//TODO mock responses with different search filters results

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