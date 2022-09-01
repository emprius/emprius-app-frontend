

import 'package:empriusapp/src/features/search_map/data/repositories/search_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';


class SearchToolsController extends StateNotifier<List<ToolModel>> {
  final SearchHttpRepository _searchHttpRepository;

  SearchToolsController({
    required SearchHttpRepository searchHttpRepository,
})
  :
      _searchHttpRepository = searchHttpRepository,
  super (<ToolModel>[]);

  Future<void> searchTools({
    String? searchTerm,
    LatLng? center,
    List<ToolCategory>? categories,
    int? maxCost,
    bool? maybeFree,
    int? availableFrom
  }) async{
    state = await _searchHttpRepository.searchTools(
       searchTerm: searchTerm,
       center: center,
      categories: categories,
       maxCost: maxCost,
       maybeFree: maybeFree,
      availableFrom:availableFrom
    );
  }

}

