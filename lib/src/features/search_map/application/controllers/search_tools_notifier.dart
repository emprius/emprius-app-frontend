import 'package:empriusapp/src/features/tool/application/notifiers/all_tools_notifier.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class SearchToolsNotifier extends StateNotifier<List<ToolModel>>{

  final ToolHttpRepository toolHttpRepository;
  final AllToolsNotifier allToolsNotifier;
  
  SearchToolsNotifier({
    required this.toolHttpRepository,
    required this.allToolsNotifier}) : super([]);

  Future<void> search({
    String? searchTerm,
    LatLng? center,
    List<ToolCategory>? categories,
    int? maxCost,
    bool? maybeFree,
    bool? isAvailable,
    int? availableFrom
  }) async {
    List<ToolModel> results = await toolHttpRepository.search(
        searchTerm: searchTerm,
        center : center,
        categories : categories,
        maxCost : maxCost,
        maybeFree : maybeFree,
        isAvailable : isAvailable,
        availableFrom : availableFrom
    );
    allToolsNotifier.addAllTool(results);
    state = results;
  }
}
