import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    String? name,
    required int id,
    required String email,
    required String password,
    required String invitation,
    required LatLng? location,
    bool? isActive,
    String? avatar,
    @Default(3) int? rating,
    @Default(10) int? emps,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

//
//
// class UserModel {
//   final int id;
//   final String name;
//   final String email;
//   final String password;
//   final String invitation;
//   final LatLng location;
//   final bool isActive;
//   final String avatar;
//   final int rating;
//   final int emps;
//
//   UserModel({
//     required this.id,
//     this.name = "",
//     required this.email,
//     required this.password,
//     required this.invitation,
//     required this.location,
//     this.isActive = true,
//     this.avatar = "",
//     this.rating = 0,
//     this.emps = 0,
//   });
//
//   UserModel copy({
//     String? name,
//     int? id,
//     String? email,
//     String? password,
//     String? invitation,
//     LatLng? location,
//     bool? isActive,
//     String? avatar,
//     int? rating,
//     int? emps,
//   }) =>
//       UserModel(
//         name: name ?? this.name,
//         id: id ?? this.id,
//         email: email ?? this.email,
//         password: password ?? this.password,
//         invitation: invitation ?? this.invitation,
//         location: location ?? this.location,
//         isActive: isActive ?? this.isActive,
//         avatar: avatar ?? this.avatar,
//         rating: rating ?? this.rating,
//         emps: emps ?? this.emps,
//       );
//
//   static UserModel fromJson(Map<String, dynamic> json) => UserModel(
//         name: json['name'],
//         id: json['id'],
//         email: json['email'],
//         password: json['password'],
//         invitation: json['invitation'],
//         location: LatLng.fromJson(json['location']),
//         avatar: json['avatar'],
//         rating: json['rating'],
//         isActive: json['isActive'],
//         emps: json['emps'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'id': id,
//         'email': email,
//         'password': password,
//         'invitation': invitation,
//         'location': location.toJson(),
//         'avatar': avatar,
//         'rating': rating,
//         'isActive': isActive,
//         'emps': emps,
//       };
// }
