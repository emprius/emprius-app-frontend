import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/i_tool_repository.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

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

//TODO class to tool model
var _sampleAvailability = [
  DateTimeRange(start: DateTime.now(), end: DateTime(DateTime.now().day + 20)),
  DateTimeRange(start: DateTime.now(), end: DateTime(DateTime.now().month + 2)),
  DateTimeRange(start: DateTime.now(), end: DateTime(DateTime.now().day + 5)),
  DateTimeRange(start: DateTime.now(), end: DateTime(DateTime.now().month + 1)),
  DateTimeRange(start: DateTime.now(), end: DateTime(DateTime.now().day + 40)),
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
      userId: 1,
      isAvailable: false,
      title: "Rec automatic",
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
      userId: 1,
      isAvailable: false,
      title: "Taladro",
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


final toolHttpProvider = Provider<ToolHttpRepository>((ref){
  return ToolHttpRepository();
});



//this class implements the interface:
class ToolHttpRepository {

  String get path => "/tool";

  Future<ToolModel> addTool({
    required ToolModel toolData,
    required int lastId // todo: this is for mocking pourposes only
  }) async {
    // 1. crear DTO

    // httpService.apicall("tools/", PUT, toolDTO)
    // Hande de la response

    var newTool = toolData.copyWith(id: lastId);

    _sampleTools.add(newTool);

    return toolData.copyWith(id: lastId);
  }


  ///String post path => "/tool/{toolId}";
  Future<ToolModel> updateTool({
    required ToolModel newTool,
    required int toolId,
  }) async {
    _sampleTools = [..._sampleTools]
      ..[_sampleTools.indexWhere((tool) => tool.id == newTool.id)] = newTool;
    return newTool.copyWith(id: newTool.id);
  }

  ///String delete path => "/tool/{toolId}";
  Future<ToolModel> deleteTool({
    required int toolId,
  }) async {
    return _sampleTools.removeAt(toolId);
  }

  ///String get path => "/tool/{toolId}";
  Future<ToolModel> fetchOne({
    required int toolId,
  }) async {
    return _sampleTools.elementAt(toolId);
  }

  ///String get path => "/tools";
  Future<List<ToolModel>> fetchAll() async {
    return _sampleTools;
  }


  ///String get path => "/tools/search/";
  Future<List<ToolModel>> getAllByUser({
    required int userId,
  }) async {
    return _sampleTools;
  }

  ///String get path => "/tools/search/";
  Future<List<ToolModel>> search({
    String? searchTerm,
    LatLng? center,
    List<ToolCategory>? categories,
    int? maxCost,
    bool? maybeFree,
    bool? isAvailable,
    int? availableFrom
    //required searchDTO,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    // return _sampleTools;
    ///Mocking response by filter
    return _sampleTools.where((element) => element.maybeFree == maybeFree).toList();
  }
}
