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

