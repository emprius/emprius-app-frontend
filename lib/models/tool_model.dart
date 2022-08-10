import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'tool_model.freezed.dart';
part 'tool_model.g.dart';

@freezed
class ToolModel with _$ToolModel {
  const factory ToolModel({
   required int id,
   required String title,
   required String description,
   required LatLng? location,
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

}


//
//   final int id;
//   final String title;
//   final String image;
//   final String description;
//   final bool isAvailable;
//   final bool needsTransport;    //List<TransportNeeded>transport; ?
//   final bool maybeFree;
//   final int rating;
//   final int cost;
//   //final Latlng? location;
//   //final bool askWithFee;
//   //final int estimatedValue;
//   //final int height;
//   //final int width;
//   //final int length;
//   //WeightRange weightRange;
//
//   //List <int> categoryIds ?
//   //List<CategoryModel>categories;
//
//   const ToolModel({
//     required this.needsTransport,
//     required this.maybeFree,
//     required this.cost,
//     required this.id,
//     required this.title,
//     required this.description,
//     this.image = "",
//     this.rating = 0,
//     this.isAvailable = true,
//   });
//
//   ToolModel copy({
//     int? id,
//     String? title,
//     String? image,
//     String? description,
//     bool? isAvailable,
//     bool? needsTransport,
//     bool? maybeFree,
//     int? rating,
//     int? cost,
//   }) =>
//       ToolModel(
//         needsTransport: needsTransport ?? this.needsTransport,
//         maybeFree: maybeFree ?? this.maybeFree,
//         cost: cost ?? this.cost,
//         id: id ?? this.id,
//         title: title ?? this.title,
//         description: description ?? this.description,
//       );
//
//   static ToolModel fromJson(Map<String, dynamic> json) => ToolModel(
//         needsTransport: json['needsTransport'],
//         maybeFree: json['maybeFree'],
//         cost: json['cost'],
//         id: json['id'],
//         title: json['title'],
//         description: json['description'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         'needsTransport': needsTransport,
//         'maybeFree': maybeFree,
//         'cost': cost,
//         'id': id,
//         'title': title,
//         'description': description,
//       };
// }
