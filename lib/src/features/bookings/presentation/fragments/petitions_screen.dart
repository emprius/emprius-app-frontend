import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/skeleton/booking_list_skeleton.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
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
        .getAllUserPetitions(fromUserId:  ref.read(userProvider).id);
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
