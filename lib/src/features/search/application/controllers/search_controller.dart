

import 'package:empriusapp/src/features/search/data/repositories/search_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchToolsController extends StateNotifier<List<ToolModel>> {
  final SearchHttpRepository _searchHttpRepository;

  SearchToolsController({
    required SearchHttpRepository searchHttpRepository,
})
  :
      _searchHttpRepository = searchHttpRepository,
  super (<ToolModel>[]);

  Future<void> searchTools() async{
    state = await _searchHttpRepository.searchTools();
  }

}

