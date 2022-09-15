import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var _sampleBookings = [
  BookingModel(
      contact: "El meu telefon es el 676899700",
      bookingStatus: BookingStatus.ASKED),
  BookingModel(
      contact: "Escriume al seguen mail",
      bookingStatus: BookingStatus.ASKED),
  //TODO write all fields and pass tool info
];

final bookingsProvider = Provider<BookingsRepository>((ref) {
  return BookingsRepository();
});


class BookingsRepository {

  Future<BookingModel> createBooking(
      {required BookingModel booking,
      required ToolModel toolData,
      required int lastId}) async {
    var newBooking = booking.copyWith(bookingId: lastId);
    _sampleBookings.add(newBooking);
    return booking.copyWith(bookingId: lastId);
  }

  Future<List<BookingModel>> getAllByUser({
  required int userId,
}) async {
    return _sampleBookings;
  }



}
