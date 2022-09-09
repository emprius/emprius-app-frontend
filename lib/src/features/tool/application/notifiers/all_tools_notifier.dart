import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/application/tool_use_cases.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';


class AllToolsNotifier extends StateNotifier<List<ToolModel>> {

  final ToolHttpRepository toolHttpRepository;
  AllToolsNotifier({required this.toolHttpRepository}) : super([]);

  Future<void> addTool(ToolModel tool) async {
    var newTool = await toolHttpRepository.addTool(
        toolData: tool,
        lastId: state.length + 1
    );
    state = [...state, newTool];
  }

  Future<void> updateTool(ToolModel newTool) async {
    // var tempList = state;
    // tempList[tempList.indexWhere((tool) => tool.toolId == newTool.toolId )] = newTool;
    var updatedTool = await toolHttpRepository.updateTool(
      newTool: newTool,
      toolId: newTool.id!
    );
    state = [...state ]
      ..[state.indexWhere((tool) => tool.id == updatedTool.id )] = updatedTool;
  }

  Future<void> deleteTool(ToolModel tool) async {
    state = [...state]..removeWhere((t) => tool.id! == t.id);
  }

  //TODO: check methods and state
  // Future<ToolModel> deleteTool({
  //   required int toolId,
  // }) async {
  //   return await _toolHttpRepository.deleteTool(toolId: toolId);
  // }

  Future<ToolModel> getToolById({
    required int toolId,
  }) async {
    return await toolHttpRepository.fetchOne(toolId: toolId);
  }

  Future<List<ToolModel>> getAllTools() {
    return toolHttpRepository.fetchAll();
  }


  Future<List<ToolModel>> getAllByUser({
    required UserModel user,
  }) async {
    return toolHttpRepository.fetchAllByUser(user: user);
  }

  //
  // Future<void> fetchAllByUser() async{
  //   state = await toolHttpRepository.fetchAllByUser(user: null);
  // }

  Future<void> addAllTool(List<ToolModel> tool) async {
    state = [...state, ...tool];
  }


}
