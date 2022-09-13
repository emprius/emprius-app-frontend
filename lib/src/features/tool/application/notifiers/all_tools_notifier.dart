import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/application/tool_use_cases.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';


///We define the methods that will be in charge of changing and emitting new states when necessary:
class AllToolsNotifier extends StateNotifier<List<ToolModel>> {

  final ToolHttpRepository toolHttpRepository;

  AllToolsNotifier({
    required this.toolHttpRepository}) : super([]);

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
    await toolHttpRepository.deleteTool(toolId: tool.id!);
    state = [...state]..removeWhere((t) => tool.id! == t.id);
  }


  Future<void> getToolById({
    required int toolId,
  }) async {
    await toolHttpRepository.fetchOne(toolId: toolId);
  }

  Future<void> getAllTools() {
    return toolHttpRepository.fetchAll();
  }


  Future<void> getAllByUser ({
    required int userId,
  }) async {
    var toolsByUserId = await toolHttpRepository.getAllByUser(userId: userId);
    state = [...state, ...toolsByUserId];
  }


  Future<void> addAllTool(List<ToolModel> tool) async {
    state = [...state, ...tool];
  }

}
