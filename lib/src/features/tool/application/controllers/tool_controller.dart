import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class OwnToolListController extends StateNotifier<List<ToolModel>> {
  final ToolHttpRepository _toolHttpRepository;

  OwnToolListController({
    required ToolHttpRepository toolHttpRepository,
  })
      :
        _toolHttpRepository = toolHttpRepository,
        super(<ToolModel>[]);


  Future<void> getOwnTools() async{
    state = await _toolHttpRepository.getOwnTools();
  }

  Future<void> addTool({
    required String title,
    required String description,
    String? image,
    bool? maybeFree,
    bool? askWithFee,
  }) async {
    final newTool = ToolModel(
      title: title,
      description: description,
      image: image,
      maybeFree: maybeFree,
      askWithFee: askWithFee,
      id: 1,
    );
    await _toolHttpRepository.addTool(
        toolData: newTool,
    );
    state = [...state, newTool];
  }

  Future<void> updateTool(ToolModel newTool, int toolId) async {
    // var tempList = state;
    // tempList[tempList.indexWhere((tool) => tool.toolId == newTool.toolId )] = newTool;
    state = [...state ]
      ..[state.indexWhere((tool) => tool.id == newTool.id )] = newTool;
  }

  Future<void> deleteTool(ToolModel tool, int toolId) async {
    state = [...state]..removeWhere((t) => t.id == tool.id);
  }

  Future<void> fetchOne(ToolModel tool, int toolId) async {
    //////
  }


}