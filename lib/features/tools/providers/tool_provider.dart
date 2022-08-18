import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import '../models/tool_model.dart';

//Mocking Future provider from network request:

final _sampleTools = [
  ToolModel(
      toolId: 1,
      title: "Bici de paseig",
      description: "¿Qué le dice la foca a su madre? I love you, mother foca.",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      //location: LatLng(41.695384, 2.492793)
),
  ToolModel(
    toolId: 2,
      title: "Burra autonoma",
      description: "Sha fet servir per raves pero encara te molta potencia.",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      //location: LatLng(41.695386, 2.492793)
),
  ToolModel(
    toolId: 3,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      needsTransport: true,
      maybeFree: true,
      cost: 10,
      //location: LatLng(41.695386, 2.492796)
),
];

final toolListProvider =
    StateNotifierProvider<ToolNotifier, List<ToolModel>>((ref) {
  return ToolNotifier(ref.read, _sampleTools);
});


class ToolNotifier extends StateNotifier<List<ToolModel>> {
  final Reader read;

  ToolNotifier(this.read, [List<ToolModel>? state])
      : super(state ?? <ToolModel>[]);

  Future<void> updateTool(ToolModel tool) async {
    //state = tool;
    // Actualitzes la persistencia per tenir les dades guardades
    // await LocalStorage.setTool(tool);
  }

  // void add(ToolModel tool) {
  //   state = [...state, ToolModel()];
  // }

}


// final bookedTools = Provider<List<ToolModel>>((ref) {
//   final tools = ref.watch(toolListProvider);
//   return tools.where((tool) => tool.booked).toList();
// });

// class ToolNotifier extends StateNotifier<List<ToolModel>>{
//   final Reader read;
//   ToolNotifier(this.read, [List<ToolModel>? state]) : super(state ?? <ToolModel>[]);
//
//   void add(String title) {
//     state = [...state, ToolModel()];
//   }
//
//   void edit({required String id, required String description}) {
//     state = [
//       for (final tool in state)
//         if (tool.id == id)
//           ToolModel(
//             description,
//             id: tool.id,
//            location: tool.location,
//           )
//         else
//           tool,
//     ];
//   }
//
//   void remove(int id) {
//     state = state.where((element) => element.id != id).toList();
//   }
//
// }
