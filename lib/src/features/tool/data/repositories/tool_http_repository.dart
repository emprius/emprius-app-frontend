import 'package:empriusapp/src/features/tool/data/mocked/mocked_tools_service.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

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

    var newTool = toolData.copyWith(id: lastId, userId: 1);

    userTools.add(newTool);

    return toolData.copyWith(id: lastId);
  }


  ///String post path => "/tool/{toolId}";
  Future<ToolModel> updateTool({
    required ToolModel newTool,
    required int toolId,
  }) async {
    userTools = [...userTools]
      ..[userTools.indexWhere((tool) => tool.id == newTool.id)] = newTool;
    return newTool.copyWith(id: newTool.id);
  }

  ///String delete path => "/tool/{toolId}";
  Future<void> deleteTool({
    required int toolId,
  }) async {
    return userTools.removeWhere((tool) => tool.id == toolId);
  }

  ///String get path => "/tool/{toolId}";
  Future<ToolModel> fetchOne({
    required int toolId,
  }) async {
    return userTools.elementAt(toolId);
  }

  ///String get path => "/tools";
  Future<List<ToolModel>> fetchAll() async {
    return userTools;
  }


  ///String get path => "/tools/search/";
  Future<List<ToolModel>> getAllByUser({
    required int userId,
  }) async {
    return userTools;
  }

  ///String get path => "/tools/search/";
  Future<List<ToolModel>> search({
    String? searchTerm,
    LatLng? center,
    List<ToolCategory>? categories,
    int? maxCost,
    bool? maybeFree,
    bool? isAvailable,
    int? availableFrom
    //required searchDTO,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    // return _userTools;
    ///Mocking response by filter
    return searchTools.where((element) => element.maybeFree == maybeFree).toList();
  }
}
