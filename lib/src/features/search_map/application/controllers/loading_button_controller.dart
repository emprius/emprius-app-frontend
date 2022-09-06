

import 'package:empriusapp/src/features/search_map/application/controllers/search_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingButtonController extends StateNotifier<AsyncValue<void>> {
  LoadingButtonController({required this.searchToolsController})
  // initialize state
      : super(const AsyncValue.data(null));
  final SearchToolsController searchToolsController;
}
