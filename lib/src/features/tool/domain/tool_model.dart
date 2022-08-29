import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tool_model.freezed.dart';
part 'tool_model.g.dart';

@freezed
class ToolModel with _$ToolModel {
  const factory ToolModel({
   int? id,
   required String title,
   required String description,
   @Default(true)bool isAvailable,
   bool? maybeFree,
   int? cost,
   List<String>? images,
   TransportOptions? transportOptions,
   ToolCategory? toolCategory,
   bool? askWithFee,
   //TODO falta implementar:
   LatLng? location,
   int? rating,
   double? estimatedValue,
   double? height,
   double? width,
   double? length,
   double? weight,
  }) = _ToolModel;

  factory ToolModel.fromJson(Map<String, dynamic> json) => _$ToolModelFromJson(json);

}


//   //List<CategoryModel>categories;