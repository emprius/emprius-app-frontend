import 'package:empriusapp/src/features/bookings/application/notifiers/all_bookings_notifier.dart';
import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final allBookingsProvider = StateNotifierProvider<AllBookingsNotifier, List<BookingModel>>((ref) {
  final _bookingsRepository = ref.watch(bookingsProvider);
  return AllBookingsNotifier(bookingsRepository: _bookingsRepository);
});


///Requested bookings TO a user (outcoming)
final requestedBookingsByUserProvider = StateProvider.family<List<BookingModel>, int>((ref, userId){
  var bookingsList = ref.watch(allBookingsProvider).where((booking) => booking.toUserId == userId).toList();
  return bookingsList;
});

///Petitioned bookings FROM a user (incoming)
final petitionedBookingsByUserProvider = StateProvider.family<List<BookingModel>, int>((ref, userId){
  var petitionsList = ref.watch(allBookingsProvider).where((booking) => booking.fromUserId == userId).toList();
  return petitionsList;
});
