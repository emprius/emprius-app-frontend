import 'dart:io';

import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingListTile extends ConsumerWidget {
  final BookingModel booking;
  final ToolModel tool;
  final void Function(BookingModel)? deleteBooking;

  const BookingListTile(this.booking, this.tool, {
    this.deleteBooking,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              CircleAvatar(
                  backgroundImage: FileImage(File(booking.userInfo!.avatar!))),
              //Icon(Icons.label),
              (booking.bookingStatus).label as Widget,
            ],
          ),
          VerticalDivider(width: 8),
        ]),
      title: Text(tool.title),
      subtitle: Text(booking.bookingStatus.displayStatus!),
      onTap: () async {
        await Navigator.pushNamed(
            context, bookingDetailScreenRoute,
            arguments:
            BookingDetailArguments(booking.bookingId!));
      },
      trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (booking.bookingStatus == BookingStatus.ASKED && ref.read(userProvider).id == booking.toUserId)
              Row(
                children: [
                  PopupMenuButton(
                    icon: Icon(Icons.edit, size: 20),
                    onSelected: (value) {
                      if (value == booking) {
                        Navigator.pushNamed(
                            context, bookingEditScreenRoute,
                            arguments: BookingDetailArguments(
                                booking.bookingId!));
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: booking,
                        child: Text("Modificar peticio"),
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.delete, size: 20),
                    onSelected: deleteBooking,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: booking,
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
