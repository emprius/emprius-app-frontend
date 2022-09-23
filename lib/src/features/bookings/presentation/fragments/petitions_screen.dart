import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
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
  // @override
  // void initState() {
  //     ref.read(allBookingsProvider.notifier)
  //         .getAllUserPetitions(fromUserId: ref.read(userProvider).id);
  //   super.initState();
  // }

  List<BookingModel> bookings =[];
  Future _refresh() async {
    bookings = ref.watch(requestBookingsProvider);
  }


  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(petitionBookingsProvider);

    return Scaffold(
        appBar: UserAppbar("Eines emprestades"),
        body: bookings.isEmpty ? Center(child: CircularProgressIndicator()) :
        RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];
              final tool = ref.watch(toolByIdProvider(booking.toolId!));

              return Column(
                children: [
                  ListTile(
                    title: Text(tool.title),
                    subtitle: Text(booking.bookingStatus.displayStatus!),
                    leading:
                        (booking.bookingStatus as BookingStatus).label as Widget,
                    onTap: () async {
                      await Navigator.pushNamed(context, bookingDetailScreenRoute,
                          arguments: BookingDetailArguments(booking.bookingId!));
                    },
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      if (booking.bookingStatus == BookingStatus.RETURNED)
                        PopupMenuButton(
                          icon: Icon(Icons.star),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: booking,
                              child: Text("Valorar usuari"),
                            ),
                          ],
                        )
                    ]),
                  )
                ],
              );
            },
          ),
        ));
  }
}
