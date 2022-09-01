
import 'package:empriusapp/src/features/search_map/application/controllers/search_controller.dart';
import 'package:empriusapp/src/features/search_map/data/repositories/search_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _searchHttpProvider = Provider<SearchHttpRepository>((ref){
  return SearchHttpRepository();
});

final searchProvider = StateNotifierProvider<SearchToolsController, List<ToolModel>>((ref) {
  final _searchHttpRepository = ref.watch(_searchHttpProvider);
  return SearchToolsController(searchHttpRepository: _searchHttpRepository,
  );
});


//TODO check wich kind of Provider - ASYNC?
// final searchByCategory = StateProvider.family<ToolModel?, categories>((ref, categories) {
//   return ref.watch(searchProvider.select());
// });