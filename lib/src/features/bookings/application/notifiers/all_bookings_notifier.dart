import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllBookingsNotifier extends StateNotifier<List<BookingModel>>{

  final BookingsRepository bookingsRepository;

  AllBookingsNotifier({
    required this.bookingsRepository}): super([]);

  Future<void> createBooking(BookingModel booking) async {
    var newBooking = await bookingsRepository.createBooking(
        booking: booking,
        lastId: state.length + 1
    );
    state = [...state,newBooking];
  }

  Future<void> editBooking(BookingModel newBooking) async{
    var editedBooking = await bookingsRepository.editBooking(
        newBooking: newBooking,
        bookingId: newBooking.bookingId!
    );
    state = [...state ]
      ..[state.indexWhere((tool) => tool.bookingId == editedBooking.bookingId )] = editedBooking;

  }

  Future<void> deleteBooking(BookingModel booking) async {
    await bookingsRepository.deleteBooking(
        bookingId: booking.bookingId!);
    state = [...state]..removeWhere((b) => booking.bookingId! == b.bookingId);
  }

  Future<void> getBookingById({
    required int bookingId,
  }) async {
    await bookingsRepository.fetchOne(bookingId: bookingId);
  }

  Future<void> getAllUserPetitions({
  required int fromUserId,
})async{
    var petitionsFromUserId = await bookingsRepository.getAllPetitions(fromUserId: fromUserId);
    state = [...state, ...petitionsFromUserId];
  }

  Future<void> getAllUserRequests({
    required int toUserId,
  })async{
    var requestsToUserId = await bookingsRepository.getAllRequests(toUserId: toUserId);
    state = [...state, ...requestsToUserId];
  }

}