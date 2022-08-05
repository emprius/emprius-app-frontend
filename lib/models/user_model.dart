import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  final String invitation;
  final LatLng? location;
  final bool isActive;
  final String avatar;
  final int rating;
  final int emps;

  UserModel({
    required this.id,
    this.name = "",
    required this.email,
    required this.password,
    required this.invitation,
    this.location,
    this.isActive = true,
    this.avatar = "",
    this.rating = 0,
    this.emps = 0,
  });

  UserModel copy({
    String? name,
    int? id,
    String? email,
    String? password,
    String? invitation,
    LatLng? location,
    bool? isActive,
    String? avatar,
    int? rating,
    int? emps,
  }) =>
      UserModel(
        name: name ?? this.name,
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        invitation: invitation ?? this.invitation,
        location: location ?? this.location,
        isActive: isActive ?? this.isActive,
        avatar: avatar ?? this.avatar,
        rating: rating ?? this.rating,
        emps: emps ?? this.emps,
      );

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        id: json['id'],
        email: json['email'],
        password: json['password'],
        invitation: json['invitation'],
        location: LatLng.fromJson(json['location']),
        avatar: json['avatar'],
        rating: json['rating'],
        isActive: json['isActive'],
        emps: json['emps'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'email': email,
        'password': password,
        'invitation': invitation,
        'location': location?.toJson(),
        'avatar': avatar,
        'rating': rating,
        'isActive': isActive,
        'emps': emps,
      };
}
