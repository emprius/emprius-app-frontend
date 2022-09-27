import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/common_widgets/status_label.dart';
import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
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
    final booking = ref.watch(bookingByIdProvider(widget.args.bookingId));
    final tool = ref.watch(toolByIdProvider(booking.toolId!));

    return booking == null
        ? Container()
        : Scaffold(
            appBar: UserAppbar("Reserva"),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 0, 5.0, 10.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    FileImage(File(booking.userInfo!.avatar!)),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            RatingStars(rating: booking.userInfo!.rating!),
                          ]),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                  "L'usuaria ${booking.userInfo!.name} ha demanat:"),
                              Text(
                                tool.title,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          (booking.bookingStatus as BookingStatus).label
                              as Widget,
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                          "Inici de la reserva: ${getFormattedDate(booking.reservedDates!.start)}"),
                      Text(
                          "Data de retorn: ${getFormattedDate(booking.reservedDates!.end)}"),
                      SizedBox(height: 20.0),
                      Text("Detalls de contacte:"),
                      SizedBox(height: 20.0),
                      Text(booking.contact),
                      SizedBox(height: 20.0),
                      if (booking.comments != null) Text(booking.comments!),
                    ]),
              ),
            ),
            floatingActionButton: booking.bookingStatus ==
                    BookingStatus.RETURNED
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (booking.bookingStatus == BookingStatus.ASKED)
                        FloatingActionButton.extended(
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Has acceptat la peticio!')),
                            );
                            await ref
                                .read(allBookingsProvider.notifier)
                                .editBooking(booking.copyWith(
                                    bookingStatus: BookingStatus.APPROVED));
                            if (!mounted) return;
                            Navigator.pushNamed(
                                context, userActivityScreenRoute);
                          },
                          label: Text("Aprova"),
                        ),
                      if (booking.bookingStatus == BookingStatus.APPROVED)
                        FloatingActionButton.extended(
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Eina retornada!')),
                            );
                            await ref
                                .read(allBookingsProvider.notifier)
                                .editBooking(booking.copyWith(
                                    bookingStatus: BookingStatus.RETURNED));
                            if (!mounted) return;
                            Navigator.pushNamed(
                                context, userActivityScreenRoute);
                          },
                          label: Text("Marca com a retornada"),
                        ),
                    ],
                  ),
          );
  }
}
