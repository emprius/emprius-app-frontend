import 'package:empriusapp/src/features/bookings/data/mocked/mocked_bookings_service.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/bookings/domain/user_info/user_info_model.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final bookingsProvider = Provider<BookingsRepository>((ref) {
  return BookingsRepository();
});


class BookingsRepository {

  ///String get path => "/bookings/petitions";
  ///Petitioned bookings FROM a user (incoming)
  Future<List<BookingModel>> getAllPetitions({
    required int fromUserId,
  }) async {
    return samplePetitions;
  }

  ///String get path => "/bookings/requests";
  ///Requested bookings TO a user (outcoming)
  Future<List<BookingModel>> getAllRequests({
    required int toUserId,
  }) async {
    return sampleRequests;
  }


  ///String get path => "/booking";
  Future<BookingModel> createBooking({
    required BookingModel booking,
    //required toolId toolId,
    required int lastId
  }) async {
    var newBooking = booking.copyWith(bookingId: lastId);
    sampleRequests.add(newBooking); // not needed
    return booking.copyWith(bookingId: lastId);
  }

  // todo(kon): not used for the moment
  ///String get path => "/booking/{bookingId}";
  // Future<BookingModel> fetchOne({
  //   required int bookingId,
  // }) async {
  //   return sampleBookings.elementAt(bookingId);
  // }


  ///String post path => "/booking/{bookingId}";
  Future<BookingModel> editBooking({
    required BookingModel newBooking,
    required int bookingId,
  }) async {
    sampleRequests = [...sampleRequests]
      ..[sampleRequests.indexWhere((booking) => booking.bookingId == newBooking.bookingId)] = newBooking;
    return newBooking.copyWith(bookingId: newBooking.bookingId);
  }


  ///String delete path => "/booking/{bookingId}";
  Future<BookingModel> deleteBooking({
    required int bookingId,
  }) async {
    return sampleRequests.removeAt(bookingId);
  }

}
