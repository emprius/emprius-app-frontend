import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestsScreen extends ConsumerStatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  createState() => _RequestsScreenState();
}

class _RequestsScreenState extends ConsumerState<RequestsScreen> {
  List<BookingModel> bookings = [];

  void _deleteBooking(BookingModel booking) {
    ref.watch(allBookingsProvider.notifier).deleteBooking(booking);
  }

  Future _refresh() async {
    bookings = ref.watch(requestBookingsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final bookings = ref.watch(requestBookingsProvider);

    return Scaffold(
      appBar: UserAppbar("Eines demanades"),
      body: bookings.isEmpty
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _refresh,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(onPressed: (){}, child: Text("Pendents")),
                        TextButton(onPressed: (){}, child: Text("En curs")),
                        TextButton(onPressed: (){}, child: Text("Retornades")),
                      ],
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => ListView.builder(
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
                                    leading: (booking.bookingStatus as BookingStatus).label
                                    as Widget,
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                          context, bookingDetailScreenRoute,
                                          arguments:
                                          BookingDetailArguments(booking.bookingId!));
                                    },
                                    trailing: Row(mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (booking.bookingStatus == BookingStatus.ASKED)
                                            PopupMenuButton(
                                              icon: Icon(Icons.edit),
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
                                          if (booking.bookingStatus == BookingStatus.ASKED)
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
                      ),
                  ),
                  ],

                // child: ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: bookings.length,
                //   itemBuilder: (context, index) {
                //     final booking = bookings[index];
                //     final tool = ref.watch(toolByIdProvider(booking.toolId!));
                //
                //     return Column(
                //       children: [
                //         ListTile(
                //           title: Text(tool.title),
                //           subtitle: Text(booking.bookingStatus.displayStatus!),
                //           leading: (booking.bookingStatus as BookingStatus).label
                //               as Widget,
                //           onTap: () async {
                //             await Navigator.pushNamed(
                //                 context, bookingDetailScreenRoute,
                //                 arguments:
                //                     BookingDetailArguments(booking.bookingId!));
                //           },
                //           trailing: Row(mainAxisSize: MainAxisSize.min,
                //               children: [
                //             if (booking.bookingStatus == BookingStatus.ASKED)
                //               PopupMenuButton(
                //                 icon: Icon(Icons.edit),
                //                 onSelected: (value) {
                //                   if (value == booking) {
                //                     Navigator.pushNamed(
                //                         context, bookingEditScreenRoute,
                //                         arguments: BookingDetailArguments(
                //                             booking.bookingId!));
                //                   }
                //                 },
                //                 itemBuilder: (context) => [
                //                   PopupMenuItem(
                //                     value: booking,
                //                     child: Text("Modificar peticio"),
                //                   ),
                //                 ],
                //               ),
                //             if (booking.bookingStatus == BookingStatus.ASKED)
                //               PopupMenuButton(
                //                 icon: Icon(Icons.delete),
                //                 onSelected: _deleteBooking,
                //                 itemBuilder: (context) => [
                //                   PopupMenuItem(
                //                     value: booking,
                //                     child: Text("Anul.lar peticio?"),
                //                   ),
                //                 ],
                //               ),
                //           ]),
                //         )
                //       ],
                //     );
                //   },
                // ),
              ),
            ),
    );
  }
}
