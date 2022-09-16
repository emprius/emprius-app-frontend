import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/application/tool_use_cases.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';


///So that tools are always painted for mocking response:
final _toolImagesPhone = [
  '/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker2314740962926778978.png',
  '/data/user/0/com.example.empriusapp/cache/image_picker2519909079312788563.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker5181464323563610078.jpg'
  // '/data/user/0/com.example.empriusapp/cache/image_picker4801801919904609723.jpg',
  // '/data/user/0/com.example.empriusapp/cache/image_picker8754154934436486707.jpg',
  // '/data/user/0/com.example.empriusapp/cache/image_picker5039266792256567929.jpg',
  // '/data/user/0/com.example.empriusapp/cache/image_picker6463638125453935552.jpg'
];
var _sampleTools = [
  ToolModel(
      id: 6,
      userId: 1,
      isAvailable: true,
      title: "Bici de paseig",
      description: "No va be per a pujades fortes pero pots dur coses al cistell",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.VEHICLE,
      transportOptions: TransportOptions.NOT_NECESSARY,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.765626, 2.407599)),
  ToolModel(
      id: 7,
      userId: 1,
      isAvailable: true,
      title: "Burra autonoma",
      description: "Sha fet servir per raves pero encara te molta potencia.",
      maybeFree: true,
      askWithFee: true,
      toolCategory: ToolCategory.ENERGY,
      transportOptions: TransportOptions.NECESSARY,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.692915, 2.540445)),
  ToolModel(
      id: 8,
      userId: 1,
      isAvailable: true,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.GARDENING,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.765964, 2.350709)),
  ToolModel(
      id: 9,
      userId: 2,
      isAvailable: false,
      title: "Tractor",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.GARDENING,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: true,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.647657, 2.469107)),
  ToolModel(
      id: 10,
      userId: 2,
      isAvailable: true,
      title: "Taladro autonom",
      description: "Es de color groc com a la canso",
      toolCategory: ToolCategory.WOODWORK,
      transportOptions: TransportOptions.EXTRA_NECESSARY,
      maybeFree: false,
      askWithFee: true,
      cost: 10,
      rating: 5,
      images: _toolImagesPhone,
      location: LatLng(41.738964, 2.498198)),
];


///We define the methods that will be in charge of changing and emitting new states when necessary:
class AllToolsNotifier extends StateNotifier<List<ToolModel>> {

  final ToolHttpRepository toolHttpRepository;

  AllToolsNotifier({
    required this.toolHttpRepository}) : super(_sampleTools);

  Future<void> addTool(ToolModel tool) async {
    var newTool = await toolHttpRepository.addTool(
        toolData: tool,
        lastId: state.length + 1
    );
    state = [...state, newTool];
  }

  Future<void> updateTool(ToolModel newTool) async {
    // var tempList = state;
    // tempList[tempList.indexWhere((tool) => tool.toolId == newTool.toolId )] = newTool;
    var updatedTool = await toolHttpRepository.updateTool(
      newTool: newTool,
      toolId: newTool.id!
    );
    state = [...state ]
      ..[state.indexWhere((tool) => tool.id == updatedTool.id )] = updatedTool;
  }

  Future<void> deleteTool(ToolModel tool) async {
    await toolHttpRepository.deleteTool(toolId: tool.id!);
    state = [...state]..removeWhere((t) => tool.id! == t.id);
  }


  Future<void> getToolById({
    required int toolId,
  }) async {
    await toolHttpRepository.fetchOne(toolId: toolId);
  }

  Future<void> getAllTools() {
    return toolHttpRepository.fetchAll();
  }


  Future<void> getAllByUser ({
    required int userId,
  }) async {
    var toolsByUserId = await toolHttpRepository.getAllByUser(userId: userId);
    state = [...state, ...toolsByUserId];
  }


  Future<void> addAllTool(List<ToolModel> tool) async {
    state = [...state, ...tool];
  }

}
