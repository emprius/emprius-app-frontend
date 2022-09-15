
import 'package:empriusapp/src/features/search_map/application/controllers/search_tools_notifier.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchToolsNotifier, List<ToolModel>>((ref) {
  final _toolHttpRepository = ref.watch(toolHttpProvider);
  final _allToolsNotifier = ref.watch(allToolsProvider.notifier);

  return SearchToolsNotifier(
    toolHttpRepository: _toolHttpRepository,
    allToolsNotifier: _allToolsNotifier,
  );
});

