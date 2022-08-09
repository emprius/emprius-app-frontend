import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tool_model.dart';


//Mocking Future provider from network request:

final _tools = [
  ToolModel(id: 1, title: "Bici de paseig", description: "¿Qué le dice la foca a su madre? I love you, mother foca.", needsTransport: true, maybeFree: true, cost: 10),
  ToolModel(id: 2, title: "Burra autonoma", description: "Sha fet servir per raves pero encara te molta potencia.", needsTransport: true, maybeFree: true, cost: 10),
  ToolModel(id: 3, title: "Tractor", description: "Es de color groc com a la canso", needsTransport: true, maybeFree: true, cost: 10),
];


final toolListProvider = StateProvider((ref) {
return _tools;
});