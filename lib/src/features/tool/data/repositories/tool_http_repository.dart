import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/i_tool_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

final _toolImagesPhone = [
'/data/user/0/com.example.empriusapp/cache/image_picker290442785517590.jpg',
'/data/user/0/com.example.empriusapp/cache/image_picker3004196561469944603.jpg',
'/data/user/0/com.example.empriusapp/cache/image_picker130200792494777690.jpg',
'/data/user/0/com.example.empriusapp/cache/image_picker5889187328360687785.jpg'
];
var _sampleTools = [
  ToolModel(
      id: 6,
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
      id: 7,
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
      id: 8,
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
      id: 9,
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
      id: 10,
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


final toolHttpProvider = Provider<ToolHttpRepository>((ref){
  return ToolHttpRepository();
});



//this class implements the interface:
class ToolHttpRepository {

  String get path => "/tool";


  Future<ToolModel> addTool({
    required ToolModel toolData,
    required int lastId // todo: this is for mocking pourposes only
  }) async {
    // 1. crear DTO

    // httpService.apicall("tools/", PUT, toolDTO)
    // Hande de la response

    var newTool = toolData.copyWith(id: lastId);

    _sampleTools.add(newTool);

    return toolData.copyWith(id: lastId);
  }


  Future<ToolModel> updateTool({
    required ToolModel newTool,
    required int toolId,
  }) async {
    _sampleTools = [..._sampleTools]
      ..[_sampleTools.indexWhere((tool) => tool.id == newTool.id)] = newTool;
    return newTool.copyWith(id: newTool.id);
  }

  Future<ToolModel> deleteTool({
    required int toolId,
  }) async {
    return _sampleTools.removeAt(toolId);
  }

  Future<ToolModel> fetchOne({
    required int toolId,
  }) async {
    return _sampleTools.elementAt(toolId);
  }

  Future<List<ToolModel>> fetchAll() async {
    return _sampleTools;
  }


  Future<List<ToolModel>> fetchAllByUser({
    required UserModel user,
  }) async {
    return _sampleTools;
  }

  Future<List<ToolModel>> search({
    required searchDTO,
  }) async {
    return _sampleTools;
  }
}
