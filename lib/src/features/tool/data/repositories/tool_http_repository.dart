import 'package:empriusapp/src/features/tool/data/mocked/mocked_tools_service.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/i_tool_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter/material.dart';
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

    var newTool = toolData.copyWith(id: lastId);

    sampleTools.add(newTool);

    return toolData.copyWith(id: lastId);
  }


  ///String post path => "/tool/{toolId}";
  Future<ToolModel> updateTool({
    required ToolModel newTool,
    required int toolId,
  }) async {
    sampleTools = [...sampleTools]
      ..[sampleTools.indexWhere((tool) => tool.id == newTool.id)] = newTool;
    return newTool.copyWith(id: newTool.id);
  }

  ///String delete path => "/tool/{toolId}";
  Future<ToolModel> deleteTool({
    required int toolId,
  }) async {
    return sampleTools.removeAt(toolId);
  }

  ///String get path => "/tool/{toolId}";
  Future<ToolModel> fetchOne({
    required int toolId,
  }) async {
    return sampleTools.elementAt(toolId);
  }

  ///String get path => "/tools";
  Future<List<ToolModel>> fetchAll() async {
    return sampleTools;
  }


  ///String get path => "/tools/search/";
  Future<List<ToolModel>> getAllByUser({
    required int userId,
  }) async {
    return sampleTools;
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
    // return _sampleTools;
    ///Mocking response by filter
    return sampleTools.where((element) => element.maybeFree == maybeFree).toList();
  }
}
