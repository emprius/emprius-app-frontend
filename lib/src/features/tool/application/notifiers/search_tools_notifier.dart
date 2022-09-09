import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_tools_notifier.dart';



//devuelve resultados d una busqueda por filtros(dto) y anyade esa lista al AllToolsProvider

class SearchToolsNotifier extends StateNotifier<List<ToolModel>>{

  final ToolHttpRepository toolHttpRepository;
  final AllToolsNotifier allToolsNotifier;
  SearchToolsNotifier({
    required this.toolHttpRepository,
    required this.allToolsNotifier}) : super([]);

  Future<List<ToolModel>> search(searchDTO) async {
    List<ToolModel> results = await toolHttpRepository.search(searchDTO: null);
    allToolsNotifier.addAllTool(results);
    state = results;
    return results;
  }
}