import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tool_model.dart';

//Mocking Future provider from network request:

final _sampleTools = [
  ToolModel(id: 1, title: "Bici de paseig", description: "¿Qué le dice la foca a su madre? I love you, mother foca.", needsTransport: true, maybeFree: true, cost: 10),
  ToolModel(id: 2, title: "Burra autonoma", description: "Sha fet servir per raves pero encara te molta potencia.", needsTransport: true, maybeFree: true, cost: 10),
  ToolModel(id: 3, title: "Tractor", description: "Es de color groc com a la canso", needsTransport: true, maybeFree: true, cost: 10),
];


final toolListProvider = StateNotifierProvider<ToolNotifier, List<ToolModel>>((ref) {
return ToolNotifier(ref.read, _sampleTools);
});

final bookedTools = Provider<List<ToolModel>>((ref) {
  final tools = ref.watch(toolListProvider);
  return tools.where((tool) => tool.booked).toList();
});



class ToolNotifier extends StateNotifier<List<ToolModel>>{
  final Reader read;

  ToolNotifier(this.read, [List<ToolModel>? state]) : super(state ?? <ToolModel>[]);

  void add(String title) {
    state = [...state, ToolModel(title, maybeFree: null)];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final tool in state)
        if (tool.id == id)
          ToolModel(
            description,
            id: todo.id,
            completed: todo.completed,
          )
        else
          tool,
    ];
  }

  void remove(String id) {
    state = state.where((element) => element.id != id).toList();
  }

}