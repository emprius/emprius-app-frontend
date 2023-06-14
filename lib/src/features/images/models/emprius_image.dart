import 'package:freezed_annotation/freezed_annotation.dart';
part 'emprius_image.freezed.dart';
part 'emprius_image.g.dart';

@freezed
class EmpriusImageModel with _$EmpriusImageModel{
  const factory EmpriusImageModel({
    required String hash,
    required String name,
    required String content,
    required String link,
  }) = _EmpriusImageModel;

  factory EmpriusImageModel.fromJson(Map<String, dynamic> json) => _$EmpriusImageModelFromJson(json);
}