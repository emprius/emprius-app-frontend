import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:latlong2/latlong.dart';

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
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.695384, 2.492793)),
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
      location: LatLng(41.695386, 2.492793)),
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
      location: LatLng(41.695386, 2.492796)),
];

class ToolHttpRepository {
  String get path => "/tool";

  Future<List<ToolModel>> getOwnTools() async {
    return _sampleTools;
  }

  Future<ToolModel> addTool({
    required ToolModel toolData,
    required int lastId // todo: this is for mocking pourposes only
  }) async {
    var newTool = toolData.copyWith(id: lastId);
    _sampleTools.add(newTool);
    return toolData.copyWith(id: lastId);
  }

  Future<ToolModel> updateTool({
  required ToolModel newTool,
    //required int toolId,
}) async{
    _sampleTools = [..._sampleTools ]
      ..[_sampleTools.indexWhere((tool) => tool.id == newTool.id )] = newTool;
    return newTool.copyWith(id: newTool.id);
  }

  Future<ToolModel> deleteTool({
  required ToolModel tool,
    required int toolId,
})async{
    return _sampleTools.removeAt(toolId);
  }

  Future<ToolModel> fetchOne({
    required int toolId,
  }) async {
    return _sampleTools.elementAt(toolId);
  }

}
