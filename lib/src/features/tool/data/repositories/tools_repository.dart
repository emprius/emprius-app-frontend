import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:latlong2/latlong.dart';

final _sampleTools = [
  ToolModel(
      toolId: 1,
      title: "Bici de paseig",
      description: "¿Qué le dice la foca a su madre? I love you, mother foca.",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      location: LatLng(41.695384, 2.492793)),
  ToolModel(
      toolId: 2,
      title: "Burra autonoma",
      description: "Sha fet servir per raves pero encara te molta potencia.",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      location: LatLng(41.695386, 2.492793)),
  ToolModel(
      toolId: 3,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      location: LatLng(41.695386, 2.492796)),
];

class ToolsRepository {

  Future<List<ToolModel>> fetchAll() async {
    return _sampleTools;
  }

  Future<ToolModel> fetchOne({
  required int toolId,
  }) async {
    return _sampleTools.elementAt(toolId);
  }

  // Future<ToolModel> create({
  //   required JSON data,
  // }) async {
    //TODO RETURN WHAT
  }

  // Future<ToolModel> update({
  //   required int toolId,
  //   required JSON data,
  // }) async {
  //   //TODO RETURN WHAT
  // }
  //
  // Future<ToolModel> delete({
  //   required int toolId,
  //   JSON? data,
  // }) async {
  //   //TODO RETURN WHAT
  // }

  //TODO CHECK IF ANOTHER MODEL
  // Future<List<UserToolListModel>> fetchUserTools({
  //   required int userId,
  // }) async {}

