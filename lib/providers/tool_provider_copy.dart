import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import '../domain/tool_model.dart';


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

class ToolProvider extends StateNotifier<List<ToolModel>>{
  ToolProvider([List<ToolModel> ? _sampleTools]) : super (_sampleTools ?? []);

  void add(String title, String description) {
    state = [
      ...state,
      ToolModel(
          id: 1,
          title: title,
          description: description,
          //location: location,
      ),
    ];
  }

  void remove(ToolModel target) {
    state = state.where((tool) => tool.id != target.id).toList();
  }

}



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
