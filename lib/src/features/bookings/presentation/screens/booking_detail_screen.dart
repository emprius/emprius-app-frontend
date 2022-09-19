import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingDetailScreen extends ConsumerStatefulWidget {
  final BookingDetailArguments args;

  const BookingDetailScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends ConsumerState<BookingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final booking = ref.watch(bookingByIdProvider(widget.args.id));
    final tool = ref.watch(toolByIdProvider(booking.toolId!));

    return booking == null
        ? Container()
        : Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                ref.read(allBookingsProvider.notifier).editBooking(booking.copyWith(bookingStatus: BookingStatus.APPROVED ));
              }, //TODO persist change status
              label: Text("Aprova"),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("L'usuaria ${booking.userInfo!.name} et fa la seguent peticio:"),
                      Text(
                      tool.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),),
                      Text("Desitja ser contacta de la seguent manera:"),
                      Text(booking.contact),
                      if(booking.comments !=null)Text(booking.comments!),
                      ]),
            ),
          );
  }
}
