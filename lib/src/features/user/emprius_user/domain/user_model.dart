import 'package:empriusapp/src/core/helper/typedefs.dart';
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{

  const factory UserModel({
    required String? name,
    @Default(-1) UserID id,
    LatLng? location,
    required bool? isActive,
    required String email,
    String? avatar,
    @Default(3.0) double? rating,
    @Default(10) int? emps,
  }) = _UserModel;

  /// Dummy factory to initialize a UserModel with default data. 
  factory UserModel.initial() =>
    const UserModel(
        email: "email", name: 'name', isActive: false,
    );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}