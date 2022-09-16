import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_info_model.freezed.dart';
//part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo{

  const factory UserInfo({
  required String? name,
  int? rating,
      String? avatar,
  }) = _UserInfo;


  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}