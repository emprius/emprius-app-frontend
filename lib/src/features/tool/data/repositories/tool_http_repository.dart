import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:latlong2/latlong.dart';


final _sampleTools = [
  ToolModel(
      id: 1,
      title: "Bici de paseig",
      description: "¿Qué le dice la foca a su madre? I love you, mother foca.",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      location: LatLng(41.695384, 2.492793)),
  ToolModel(
      id: 2,
      title: "Burra autonoma",
      description: "Sha fet servir per raves pero encara te molta potencia.",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      location: LatLng(41.695386, 2.492793)),
  ToolModel(
      id: 3,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      location: LatLng(41.695386, 2.492796)),
];

class ToolHttpRepository {
  String get path => "/tool";

  Future<List<ToolModel>> getOwnTools() async {
    return _sampleTools;
  }

  Future<ToolModel> addTool({
    required ToolModel toolData,
  }) async {
    return toolData.copyWith(id: 4);
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
