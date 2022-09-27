import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/bookings/domain/user_info/user_info_model.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var _sampleBookings = [
  BookingModel(
    bookingId: 1,
      toolId: 6, //bici de passeig
      emps: 6,
      fromUserId: 1,
      toUserId: 2,
      contact: "El meu telefon es el 676899700",
      comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.ASKED,
      reservedDates: DateTimeRange(start: DateTime.now(), end: DateTime(2030, 12, 31)),
      userInfo: UserInfo(
        name: "Crac",
        rating: 10,
        avatar: "/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg",
      )),

  BookingModel(
      bookingId: 2,
      toolId: 7, //burra autonoma
      fromUserId: 1,
      toUserId: 2,
      contact: "Escriume al seguen mail",
      comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.APPROVED,
      reservedDates: DateTimeRange(start: DateTime.now(), end: DateTime(2022, 12, 31)),
      userInfo: UserInfo(
        name: "Elai",
        rating: 3,
        avatar: "/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg",
      )),

  BookingModel(
      bookingId: 5,
      toolId: 8, //tractor
      fromUserId: 2,
      toUserId: 1,
      contact: "Enviam un signal el meu usuari es",
      comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.ASKED,
      reservedDates: DateTimeRange(start: DateTime.now(), end: DateTime(2022, 11, 31)),
      userInfo: UserInfo(
        name: "Ariadna",
        rating: 5,
        avatar: "/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg",
      )),

  BookingModel(
    bookingId: 3,
      toolId: 9, //rec automatic
      fromUserId: 2,
      toUserId: 1,
      contact: "Escriume al seguen mail",
      comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.APPROVED,
      reservedDates: DateTimeRange(start: DateTime.now(), end: DateTime(2022, 12, 31)),
      userInfo: UserInfo(
        name: "Coco",
        rating: 5,
        avatar: "/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg",
      )),

  BookingModel(
      bookingId: 4,
      toolId: 10, //taladro
      fromUserId: 2,
      toUserId: 1,
      contact: "Enviam un signal el meu usuari es",
      comments: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      bookingStatus: BookingStatus.RETURNED,
      reservedDates: DateTimeRange(start: DateTime.now(), end: DateTime(2023, 12, 31)),
      userInfo: UserInfo(
        name: "Ariadna",
        rating: 4,
        avatar: "/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg",
      )),


];

final bookingsProvider = Provider<BookingsRepository>((ref) {
  return BookingsRepository();
});


class BookingsRepository {

  ///String get path => "/bookings/petitions";
  ///Petitioned bookings FROM a user (incoming)
  Future<List<BookingModel>> getAllPetitions({
  required int fromUserId,
}) async {
    return _sampleBookings;
  }

  ///String get path => "/bookings/requests";
  ///Requested bookings TO a user (outcoming)
  Future<List<BookingModel>> getAllRequests({
    required int toUserId,
  }) async {
    return _sampleBookings;
  }


  ///String get path => "/booking";
  Future<BookingModel> createBooking({
    required BookingModel booking,
    //required toolId toolId,
    required int lastId
  }) async {
    var newBooking = booking.copyWith(bookingId: lastId);
    _sampleBookings.add(newBooking);
    return booking.copyWith(bookingId: lastId);
  }

  ///String get path => "/booking/{bookingId}";
  Future<BookingModel> fetchOne({
    required int bookingId,
  }) async {
    return _sampleBookings.elementAt(bookingId);
  }


  ///String post path => "/booking/{bookingId}";
  Future<BookingModel> editBooking({
    required BookingModel newBooking,
    required int bookingId,
  }) async {
    _sampleBookings = [..._sampleBookings]
      ..[_sampleBookings.indexWhere((booking) => booking.bookingId == newBooking.bookingId)] = newBooking;
    return newBooking.copyWith(bookingId: newBooking.bookingId);
  }


  ///String delete path => "/booking/{bookingId}";
  Future<BookingModel> deleteBooking({
    required int bookingId,
  }) async {
    return _sampleBookings.removeAt(bookingId);
  }


  // TODO change booking status call + create Rating repository
//String get path => "/bookings/rate";
//String post path => "/booking/rate";


}
