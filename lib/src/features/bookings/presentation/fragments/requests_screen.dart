import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/skeleton/booking_list_skeleton.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestsScreen extends ConsumerStatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  createState() => _RequestsScreenState();
}

class _RequestsScreenState extends ConsumerState<RequestsScreen> {

  Future _refresh() async {
      ref.watch(allBookingsProvider.notifier)
          .getAllUserRequests(userId: ref.read(currentUserProvider)!.id);
    }

  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(requestBookingsProvider);
    return BookingListSkeleton(
      onRefresh: _refresh,
      bookings: bookings,
      appbarTitle: "Eines demanades",
    );
  }
}
