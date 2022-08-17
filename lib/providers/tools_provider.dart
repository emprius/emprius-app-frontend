import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/tool_model.dart';
import '../infrastructure/repositories/tools_repository.dart';

class ToolsProvider{
  final ToolsRepository _toolsRepository;
  final Ref _ref;

  ToolsProvider({
    required ToolsRepository toolsRepository,
    required Ref ref,
}) : _toolsRepository = toolsRepository,
  _ref = ref,
  super();

  Future<List<ToolModel>> getAllTools() async {
    return await _toolsRepository.fetchAll();
  }

  Future<ToolModel> getToolById({
  required int toolId,
}) async {
    return await _toolsRepository.fetchOne(toolId : toolId);
  }

  //TODO: finish implementation and return type:
//   Future<ToolModel> addTool({
//     required String title,
//     required String description,
// }) async{
//     final tool = ToolModel(
//         toolId: null,
//         title: title,
//         description: description,
//     );
//     final data = <String, Object?>{
//       ...tool.toJson(),
//     };
//     final toolId = await _toolsRepository.create(data: data);
//     return tool.copyWith(toolId: toolId);
// }




  // Future<List<UserToolListModel>> getUserTools({
  //   required int userId,
  // }) async {
  //   return await _toolsRepository.fetchUserTools(userId: userId);
  // }

}



//
//
//
//
// class ToolProvider extends StateNotifier<List<ToolModel>>{
//   ToolProvider([List<ToolModel> ? _sampleTools]) : super (_sampleTools ?? []);
//
//   void add(String title, String description) {
//     state = [
//       ...state,
//       ToolModel(
//           toolId: 1,
//           title: title,
//           description: description,
//           //location: location,
//       ),
//     ];
//   }
//
//   void remove(ToolModel target) {
//     state = state.where((tool) => tool.toolId != target.toolId).toList();
//   }
//
// }



//
// final toolListProvider =
//     StateNotifierProvider<ToolNotifier, List<ToolModel>>((ref) {
//   return ToolNotifier(ref.read, _sampleTools);
// });
//
//
// class ToolNotifier extends StateNotifier<List<ToolModel>> {
//   final Reader read;
//
//   ToolNotifier(this.read, [List<ToolModel>? state])
//       : super(state ?? <ToolModel>[]);
//
//   Future<void> updateTool(ToolModel tool) async {
//     //state = tool;
//     // Actualitzes la persistencia per tenir les dades guardades
//     await LocalStorage.setTool(tool);
//   }
//
//   void add(ToolModel tool) {
//     state = [...state, ToolModel()];
//   }
//
// }
//
//
// // final bookedTools = Provider<List<ToolModel>>((ref) {
// //   final tools = ref.watch(toolListProvider);
// //   return tools.where((tool) => tool.booked).toList();
// // });
//
// // class ToolNotifier extends StateNotifier<List<ToolModel>>{
// //   final Reader read;
// //   ToolNotifier(this.read, [List<ToolModel>? state]) : super(state ?? <ToolModel>[]);
// //
// //   void add(String title) {
// //     state = [...state, ToolModel()];
// //   }
// //
// //   void edit({required String id, required String description}) {
// //     state = [
// //       for (final tool in state)
// //         if (tool.id == id)
// //           ToolModel(
// //             description,
// //             id: tool.id,
// //            location: tool.location,
// //           )
// //         else
// //           tool,
// //     ];
// //   }
// //
// //   void remove(int id) {
// //     state = state.where((element) => element.id != id).toList();
// //   }
// //
// // }
