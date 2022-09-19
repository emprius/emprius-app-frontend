import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
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
              onPressed: () {}, //TODO: change booking status
              label: Text("Aprova"),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            tool.title,
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),)
                      ])
                ])),
          );
  }
}
