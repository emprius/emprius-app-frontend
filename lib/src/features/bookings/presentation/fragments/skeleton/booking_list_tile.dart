import 'dart:io';

import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingListTile extends ConsumerStatefulWidget {
  final BookingModel booking;
  final ToolModel tool;

  const BookingListTile(this.booking, this.tool, {Key? key}) : super(key: key);

  @override
  ConsumerState<BookingListTile> createState() => _BookingListTileState();
}

class _BookingListTileState extends ConsumerState<BookingListTile> {
  void _deleteBooking(BookingModel booking) {
    ref.watch(allBookingsProvider.notifier).deleteBooking(booking);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.booking.fromUserId != ref.watch(userProvider).id
                ? Icon(
              Icons.arrow_circle_left_outlined,
              color: Theme.of(context).colorScheme.error,
              size: 20,
            )
                : Icon(
              Icons.outbound_outlined,
              color: Theme.of(context).colorScheme.error,
              size: 20,
            ),
            CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage(widget.booking.userInfo!.avatar!)),
          ]),
      title: Text(widget.tool.title),
      subtitle: Row(
        children: [
          (widget.booking.bookingStatus).label as Widget,
          Expanded(
            child: Text("${widget.booking.bookingStatus.displayStatus!}\n${widget.booking.contact}",
              overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
      onTap: () async {
        await Navigator.pushNamed(context, bookingDetailScreenRoute,
            arguments: BookingDetailArguments(widget.booking.bookingId!));
      },
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (widget.booking.bookingStatus == BookingStatus.ASKED &&
            ref.read(userProvider).id == widget.booking.fromUserId)
          Row(
            children: [
              PopupMenuButton(
                icon: Icon(Icons.edit, size: 20),
                onSelected: (value) {
                  if (value == widget.booking) {
                    Navigator.pushNamed(context, bookingEditScreenRoute,
                        arguments:
                            BookingDetailArguments(widget.booking.bookingId!));
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: widget.booking,
                    child: Text("Modificar peticio"),
                  ),
                ],
              ),
              PopupMenuButton(
                icon: Icon(Icons.delete, size: 20),
                onSelected: _deleteBooking,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: widget.booking,
                    child: Text("Anul.lar peticio?"),
                  ),
                ],
              ),
            ],
          ),
        Icon(Icons.navigate_next)
        //if (booking.bookingStatus == BookingStatus.ALL)
        //(booking.bookingStatus as BookingStatus).label as Widget,
      ]),
    );
  }
}
