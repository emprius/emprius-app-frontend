import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// todo(kon): yes, probably it has much more sense to have two separated
//  notifiers, one for requests and other for petitions.
class AllBookingsNotifier extends StateNotifier<List<BookingModel>>{

  final BookingsRepository bookingsRepository;

  AllBookingsNotifier({
    required this.bookingsRepository}): super([]);

  Future<void> createBooking(BookingModel booking) async {
    var newBooking = await bookingsRepository.createBooking(
        booking: booking,
        lastId: state.length + 1
    );
    state = [...state, newBooking];
    //state = new List.from([...state])..add(newBooking);
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

  // todo(kon): not used for the moment
  // Future<void> getBookingById({
  //   required int bookingId,
  // }) async {
  //   await bookingsRepository.fetchOne(bookingId: bookingId);
  // }

  Future<void> getAllUserPetitions({
    required int fromUserId, // todo: use actual session user id instead of use it as parameter
  })async{
    var petitionsFromUserId = await bookingsRepository.getAllPetitions(fromUserId: fromUserId);
    state.removeWhere((booking) => booking.fromUserId == fromUserId ); // Remove here old petitions (we are requesting an updated list from the server)
    state = [...state, ...petitionsFromUserId]; // Update the state with the new list
  }

  Future<void> getAllUserRequests({
    required int toUserId, // todo: use actual session user id instead of use it as parameter
  })async{
    var requestsToUserId = await bookingsRepository.getAllRequests(toUserId: toUserId);
    state.removeWhere((booking) => booking.toUserId == toUserId ); // Remove here old petitions (we are requesting an updated list from the server)
    state = [...state, ...requestsToUserId]; // Update the state with the new list
  }

}