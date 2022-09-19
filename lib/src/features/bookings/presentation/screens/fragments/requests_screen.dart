import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestsScreen extends ConsumerStatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  createState() => _RequestsScreenState();
}

class _RequestsScreenState extends ConsumerState<RequestsScreen> {
  //TODO implement edit/details booking?:
  void _editBooking(BookingModel booking) {
    ref.watch(allBookingsProvider.notifier).editBooking(booking);
  }

  //TODO why is deleting everything
  void _deleteBooking(BookingModel booking) {
    ref.watch(allBookingsProvider.notifier).deleteBooking(booking);
  }

  @override
  void initState() {
    ref
        .read(allBookingsProvider.notifier)
        .getAllUserRequests(toUserId: ref.read(userProvider).id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(requestBookingsProvider);

    return Scaffold(

      body: ListView.builder(
        shrinkWrap: true,
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          final tool = ref.watch(toolByIdProvider(booking.toolId!));
          // late bool _waitingAproval =
          //     booking.bookingStatus.displayStatus == "Demanada";

          return Column(
            children: [
              Text("Eines demanades"),
              ListTile(
                onTap: () async{
                    await Navigator.pushNamed(context, bookingDetailScreenRoute, arguments: BookingDetailArguments(booking.bookingId!));
                    },
                title: Text(tool.title),
                subtitle: Text(booking.bookingStatus.displayStatus!),
                // leading: IconButton(
                //   onPressed: () {
                //     //TODO PASS FROM ASKED TO APROVED SWITCH STATUS?
                //   },
                //   icon: _waitingAproval
                //       ? Icon(Icons.question_mark_outlined)
                //       : Icon(Icons.check),
                // ),
                leading: (booking.bookingStatus as BookingStatus).label as Widget,
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  PopupMenuButton(
                    icon: Icon(Icons.edit),
                    onSelected: _editBooking,
                    //TODO needs a new screen to edit:
                    // onSelected: (value){
                    //   if(value == booking) {
                    //     Navigator.pushNamed(context, toolEditCardScreenRoute,
                    //         arguments: EditToolArguments(tool.id!));
                    //   }
                    // },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: booking,
                        child: Text("Modificar peticio"),
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.delete),
                    onSelected: _deleteBooking,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: booking,
                        child: Text("Anul.lar peticio?"),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          );
        },
      ),
    );
  }
}
