import 'package:empriusapp/src/features/tool/application/notifiers/all_tools_notifier.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// With Riverpod providers are declared as global variables and inserted into the widget tree by ProviderScope.

/// Here we define the types of Providers we are going to use
/// and where the feature's dependency injection is done

/// A StateNotiferProvider receives two generic types:
/// the Notifier that will extend from it, and the state or complex object.
/// Then get the reference that allows us to read the value or state
///
final allToolsProvider = StateNotifierProvider<AllToolsNotifier, List<ToolModel>> ((ref) {
  final _toolHttpRepository = ref.watch(toolHttpProvider);

  return AllToolsNotifier(toolHttpRepository: _toolHttpRepository);
});


final authUserToolsProvider = StateProvider<List<ToolModel>>((ref) {
  var userId = ref.watch(currentUserProvider.select((user) => user!.id));
  return  ref.watch(toolsByUserProvider(userId));
});


///Allows to pass in a type
final toolsByUserProvider = StateProvider.family<List<ToolModel>, int>((ref, userId){
  var toolList = ref.watch(allToolsProvider).where((tool) => tool.userId == userId).toList();
  return toolList;
});


final toolByIdProvider = StateProvider.family<ToolModel, int>((ref, toolId) {
 return ref.watch(allToolsProvider)
      .firstWhere((tool) => tool.id == toolId);
});

