// class ToolUseCases{
//   final ToolRepository _toolRepository;
//
//
//   ToolUseCases({
//     ToolRepository toolRepository
//   }) :
//         _toolRepository = toolRepository,
//         super(<ToolModel>[]);
//
//
//   Future<ToolModel> execute(AddToolRequest addToolRequest) {
//     String id = toolRepository.save(addToolRequest);
//     return toolRepository.findById(id).get();
//
//     // var newTool = await _toolHttpRepository.addTool(
//     //     toolData: tool,
//     //     lastId: state.length + 1
//     // );
//     // state = [...state, newTool];
//
//   }
//
//
// }

