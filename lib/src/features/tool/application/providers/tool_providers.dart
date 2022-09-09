import 'package:empriusapp/src/features/tool/application/notifiers/all_tools_notifier.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



//state notifier provider recibe dos tipos genericos: el notifier y el estado del notifier
final allToolsProvider = StateNotifierProvider<AllToolsNotifier, List<ToolModel>> ((ref) {

  //unica instancia del repo aqui / si cambia se reinstancia al notifier:
  final _toolHttpRepository = ref.watch(toolHttpProvider);

  return AllToolsNotifier(toolHttpRepository: _toolHttpRepository);
});


final toolsByUserProvider = StateProvider.family<List<ToolModel>, int>((ref, userId){
  return ref.watch(allToolsProvider).where((tool) => tool.userId == userId).toList();
});


final authUserToolsProvider = StateProvider<List<ToolModel>>((ref) {
  var userId = ref.watch(userProvider.select((user) => user.id));
  return ref.watch(toolsByUserProvider(userId));
});


// TODO check this out
final toolByIdProvider = StateProvider.family<ToolModel, int>((ref, toolId) {
 return ref.watch(allToolsProvider.select((toolList) => toolList
      .firstWhere((tool) => tool.id == toolId)));
});


// TODO implement search provider:
// final searchToolsProvider = StateProvider.family<List<ToolModel>, dynamic>((ref, dynamic) {
//   return ref.watch(allToolsProvider).where((element) => false)
// });
