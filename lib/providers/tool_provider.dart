import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tool_model.dart';


//Mocking Future provider from network request:

final _tools = [
  Tool(id: '1', title: "Bici de paseig", description: "¿Qué le dice la foca a su madre? I love you, mother foca."),
  Tool(id: '2', title: "Burra autonoma", description: "Sha fet servir per raves pero encara te molta potencia."),
  Tool(id: '3', title: "Tractor", description: "Es de color groc com a la canso"),
];


final toolListProvider = StateProvider((ref) {
return _tools;
});