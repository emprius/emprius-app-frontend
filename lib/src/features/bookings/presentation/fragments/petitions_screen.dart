import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/skeleton/booking_list_skeleton.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PetitionsScreen extends ConsumerStatefulWidget {
  const PetitionsScreen({Key? key}) : super(key: key);

  @override
  createState() => _PetitionsScreenState();
}

class _PetitionsScreenState extends ConsumerState<PetitionsScreen> {

  Future _refresh() async {
    ref.watch(allBookingsProvider.notifier)
        .getAllUserPetitions(userId: ref.read(currentUserProvider)!.id);
  }


  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(petitionBookingsProvider);
    return BookingListSkeleton(
        onRefresh: _refresh,
        bookings: bookings,
        appbarTitle: "Eines emprestades");
  }
}
