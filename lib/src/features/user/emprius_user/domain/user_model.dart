import 'package:empriusapp/src/core/helper/constants/constants.dart';
import 'package:empriusapp/src/core/helper/typedefs.dart';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:empriusapp/src/core/shared/domain/lat_lng_converter.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  // Added constructor in order to have custom getters
  const UserModel._();

  const factory UserModel({
    @Default(-1) UserID id,
    required String? name,
    required String email,
    String? community,
    int? tokens,
    required bool? active,
    double? rating,
    String? avatarHash,
    @LatLngConverter() LatLng? location,
  }) = _UserModel;


  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  String get avatar => avatarHash ?? defaultAvatar;
}