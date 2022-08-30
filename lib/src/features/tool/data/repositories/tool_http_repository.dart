import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:latlong2/latlong.dart';

// final _toolImagesUrl = [
//   'https://images.unsplash.com/photo-1581166397057-235af2b3c6dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
//   'https://images.unsplash.com/photo-1501516069922-a9982bd6f3bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
//   'https://images.unsplash.com/photo-1519003722824-194d4455a60c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1175&q=80',
//   'https://images.unsplash.com/photo-1587582423116-ec07293f0395?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
// ];

final _toolImagesPhone = [
'/data/user/0/com.example.empriusapp/cache/image_picker4801801919904609723.jpg',
'/data/user/0/com.example.empriusapp/cache/image_picker8754154934436486707.jpg',
'/data/user/0/com.example.empriusapp/cache/image_picker5039266792256567929.jpg',
'/data/user/0/com.example.empriusapp/cache/image_picker6463638125453935552.jpg'
];

final _sampleTools = [
  ToolModel(
      id: 1,
      title: "Bici de paseig",
      description: "No va be per a pujades fortes pero pots dur coses al cistell",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.VEHICLE,
      transportOptions: TransportOptions.NOT_NECESSARY,
      cost: 10,
      images: _toolImagesPhone,
      location: LatLng(41.695384, 2.492793)),
  ToolModel(
      id: 2,
      title: "Burra autonoma",
      description: "Sha fet servir per raves pero encara te molta potencia.",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.ENERGY,
      transportOptions: TransportOptions.NECESSARY,
      cost: 10,
      images: _toolImagesPhone,
      location: LatLng(41.695386, 2.492793)),
  ToolModel(
      id: 3,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.GARDENING,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
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
    required int toolId,
}) async{
    return newTool.copyWith(id: toolId);
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
