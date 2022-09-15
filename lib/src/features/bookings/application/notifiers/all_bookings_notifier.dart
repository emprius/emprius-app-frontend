import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllBookingsNotifier extends StateNotifier<List<BookingModel>>{

  final BookingsRepository bookingsRepository;

  AllBookingsNotifier({
    required this.bookingsRepository}): super([]);
//
//   Future<void> createBooking(BookingModel booking) async {
//     var newBooking = await bookingsRepository.createBooking(
//         booking: booking,
//         toolData: toolData,
//         lastId: state.length + 1
//     );
//     state = [...state,newBooking];
//   }
//
//   Future<void> getAllByUser({
//   required int userId,
//   }) async {
//   var bookingsByUserId = await bookingsRepository.getAllByUser(
//   userId: userId);
//   state = [...state, ...bookingsByUserId];
// }

}