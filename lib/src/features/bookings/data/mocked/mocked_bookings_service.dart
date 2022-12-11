import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/bookings/domain/user_info/user_info_model.dart';
import 'package:flutter/material.dart';

var sampleAvatars = [
  'assets/avatars/avatar1.png',
  'assets/avatars/avatar2.png',
];

var samplePetitions = [
  BookingModel(
      bookingId: 1,
      toolId: 6, //bici de passeig
      emps: 6,
      fromUserId: 1,
      toUserId: 2,
      contact: "El meu telefon es el 676899700",
      comments:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.ASKED,
      reservedDates:
          DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
      userInfo: UserInfo(
        name: "Crac",
        rating: 10,
        avatar: sampleAvatars[0],
      ),
  ),
  BookingModel(
      bookingId: 2,
      toolId: 7, //burra autonoma
      fromUserId: 1,
      toUserId: 2,
      contact: "Escriume al seguent mail",
      comments:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.RETURNED,
      reservedDates:
          DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
      userInfo: UserInfo(
        name: "Elai",
        rating: 3,
        avatar: sampleAvatars[0],
      ),
  ),
  BookingModel(
      bookingId: 5,
      toolId: 8, //tractor
      fromUserId: 1,
      toUserId: 2,
      contact: "Enviam un signal el meu usuari es",
      comments:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.ASKED,
      reservedDates:
          DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
      userInfo: UserInfo(
        name: "Ariadna",
        rating: 5,
        avatar: sampleAvatars[1],
      )),
  BookingModel(
      bookingId: 3,
      toolId: 9,     //rec automatic
      fromUserId: 1,
      toUserId: 2,
      contact: "Escriume al seguen mail",
      comments:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.APPROVED,
      reservedDates:
          DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
      userInfo: UserInfo(
        name: "Coco",
        rating: 5,
        avatar: sampleAvatars[1],
      ),
  ),
  BookingModel(
      bookingId: 4,
      toolId: 10, //taladro
      fromUserId: 1,
      toUserId: 2,
      contact: "Enviam un signal el meu usuari es",
      comments:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.RETURNED,
      reservedDates:
          DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
      userInfo: UserInfo(
        name: "Ariadna",
        rating: 4,
        avatar: sampleAvatars[1],
      )),
];



var sampleRequests = [
  BookingModel(
    bookingId: 6,
    toolId: 6, //bici de passeig
    emps: 6,
    fromUserId: 2,
    toUserId: 1,
    contact: "El meu telefon es el 676899700",
    comments:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    bookingStatus: BookingStatus.ASKED,
    reservedDates:
    DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
    userInfo: UserInfo(
      name: "Crac",
      rating: 10,
      avatar: sampleAvatars[0],
    ),
  ),
  BookingModel(
    bookingId: 7,
    toolId: 7, //burra autonoma
    fromUserId: 2,
    toUserId: 1,
    contact: "Escriume al seguent mail",
    comments:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
    bookingStatus: BookingStatus.APPROVED,
    reservedDates:
    DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
    userInfo: UserInfo(
      name: "Elai",
      rating: 3,
      avatar: sampleAvatars[0],
    ),
  ),
  BookingModel(
      bookingId: 8,
      toolId: 8, //tractor
      fromUserId: 2,
      toUserId: 1,
      contact: "Enviam un signal el meu usuari es",
      comments:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.ASKED,
      reservedDates:
      DateTimeRange(start: DateTime.now(), end: DateTime.now().add(const Duration(days: 30))),
      userInfo: UserInfo(
        name: "Ariadna",
        rating: 5,
        avatar: sampleAvatars[1],
      )),
];