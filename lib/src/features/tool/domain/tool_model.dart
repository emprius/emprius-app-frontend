import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tool_model.freezed.dart';
part 'tool_model.g.dart';

@freezed
class ToolModel with _$ToolModel {
  const factory ToolModel({
   required int toolId,
   required String title,
   required String description,
   LatLng? location,
   @Default(true)bool? isAvailable,
    String? image,
   bool? needsTransport,   //List<TransportNeeded>transport; ?
   bool? maybeFree,
   int? rating,
   int? cost,
   bool? askWithFee,
   double? estimatedValue,
   double? height,
   double? width,
   double? length,
   double? weight,
  }) = _ToolModel;

  factory ToolModel.fromJson(Map<String, dynamic> json) => _$ToolModelFromJson(json);

}


//   //List<CategoryModel>categories;