import 'package:empriusapp/src/features/search_map/application/providers/search_provider.dart';
import 'package:empriusapp/src/features/tool/application/controllers/tool_controller.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _toolHttpProvider = Provider<ToolHttpRepository>((ref){
  return ToolHttpRepository();
});


final ownToolsProvider = StateNotifierProvider<OwnToolListController, List<ToolModel>>((ref) {
  final _toolHttpRepository =  ref.watch(_toolHttpProvider);
  return OwnToolListController(
      toolHttpRepository: _toolHttpRepository,
  );
});


final toolByIdProvider = StateProvider.family<ToolModel?, int>((ref, id) {
  var ownToolsProv = ref.watch(ownToolsProvider);
  ToolModel? tool;
  if(ownToolsProv.isNotEmpty) {
     tool = ref.watch(ownToolsProvider.select((toolList) => toolList
        .firstWhere((tool) => tool.id == id,)));
  }
  var searchProvi = ref.watch(searchProvider);
  if(tool == null && searchProvi.isNotEmpty) {
    tool = ref.watch(searchProvider.select((toolList) =>
        toolList.firstWhere((tool) => tool.id == id)));
  }
  return tool;
});
