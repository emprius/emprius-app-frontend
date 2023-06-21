import 'package:empriusapp/src/features/bookings/application/notifiers/all_bookings_notifier.dart';
import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final allBookingsProvider = StateNotifierProvider<AllBookingsNotifier, List<BookingModel>>((ref) {
  final _bookingsRepository = ref.watch(bookingsProvider);
  return AllBookingsNotifier(bookingsRepository: _bookingsRepository);
});


///To filter the list of bookings according to the booking status,
///Create a StateProvider which exposes the currently selected filter method:
final bookingFilterProvider = StateProvider<BookingStatus>((ref) => BookingStatus.ALL);

///Together with the global StateNotifierProvider that exposes a bookings list,
///And a separate provider which combines the filter method and the bookings list:
final filteredBookingProvider = Provider<List<BookingModel>>((ref){
  final filterStatus = ref.watch(bookingFilterProvider);
  final bookings = ref.watch(allBookingsProvider);

  switch(filterStatus){
    case BookingStatus.ALL:
      return bookings;
    case BookingStatus.APPROVED:
      return bookings.where((booking) => booking.bookingStatus == BookingStatus.APPROVED).toList();
    case BookingStatus.ASKED:
      return bookings.where((booking) =>  booking.bookingStatus == BookingStatus.ASKED).toList();
    case BookingStatus.RETURNED:
      return bookings.where((booking) => booking.bookingStatus == BookingStatus.RETURNED).toList();
  }
});

///Requested bookings TO a user (outcoming):
final requestBookingsProvider = StateProvider<List<BookingModel>>((ref) {
    var userId = ref.watch(currentUserProvider)!.id;
    var allBookings = ref.watch(filteredBookingProvider);
    return allBookings.where((booking) => booking.fromUserId == userId).toList();
});

///Petitioned bookings FROM a user (incoming):
final petitionBookingsProvider = StateProvider<List<BookingModel>>((ref) {
  var userId = ref.watch(currentUserProvider)!.id;
  var allBookings = ref.watch(filteredBookingProvider);
  return allBookings.where((booking) => booking.toUserId == userId).toList();
});


final bookingByIdProvider = StateProvider.family<BookingModel, int>((ref, id) {
  return ref.watch(allBookingsProvider)
      .firstWhere((booking) => booking.bookingId == id);
});