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


  // Future<void> addTool({
  //   required String title,
  //   required String description,
  //   List<String>? images,
  //   bool? maybeFree,
  //   bool? askWithFee,
  // }) async {
  //   var newTool = await _toolHttpRepository.addTool(
  //       toolData:  ToolModel(
  //         title: title,
  //         description: description,
  //         images: images,
  //         maybeFree: maybeFree,
  //         askWithFee: askWithFee,
  //       ),
  //     lastId: state.length + 1
  //   );
  //   state = [...state, newTool];
  // }

  Future<void> addTool(ToolModel tool) async {
    var newTool = await _toolHttpRepository.addTool(
        toolData: tool,
        lastId: state.length + 1
    );
    state = [...state, newTool];
  }

  Future<void> updateTool(ToolModel newTool) async {
    // var tempList = state;
    // tempList[tempList.indexWhere((tool) => tool.toolId == newTool.toolId )] = newTool;
    state = [...state ]
      ..[state.indexWhere((tool) => tool.id == newTool.id )] = newTool;
  }

  Future<void> deleteTool(ToolModel tool) async {
    state = [...state]..removeWhere((t) => tool.id! == t.id);
  }

  // Future<void> fetchOne(ToolModel tool, int toolId) async {
  //   //////
  // }


}