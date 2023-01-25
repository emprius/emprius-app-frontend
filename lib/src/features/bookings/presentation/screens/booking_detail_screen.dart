import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
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

    return Scaffold(
            appBar: UserAppbar("Reserva"),
            body: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage(booking.userInfo!.avatar!),
                      ),
                      title: Row(
                        children: [
                          Text(
                            "${booking.userInfo!.name}",
                            style:
                                TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          RatingStars(rating: booking.userInfo!.rating!),
                        ],
                      ),
                      subtitle: Text(booking.contact),
                    ),
                    Stack(children: [
                      Center(
                        child: Hero(
                          tag: tool.images![0],
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.8,
                                  image: AssetImage(tool.images![0]),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.5),
                            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
                        child: Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.calendar_month_outlined),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                    "${getFormattedDate(booking.reservedDates!.start)} : ${getFormattedDate(booking.reservedDates!.end)} "),
                              ),
                            ]),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(tool.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                            )),
                        const SizedBox(width: 8.0),
                        (booking.bookingStatus).label as Widget,
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        booking.comments!,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    booking.bookingStatus == BookingStatus.RETURNED
                        ? Container()
                        : ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              if (booking.bookingStatus == BookingStatus.ASKED
                                  && booking.fromUserId != ref.read(userProvider).id)
                                CustomTextButton(
                                  text: 'APROVA',
                                  onClicked: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Has acceptat la peticio!')),
                                    );
                                    await ref
                                        .read(allBookingsProvider.notifier)
                                        .editBooking(booking.copyWith(
                                            bookingStatus:
                                                BookingStatus.APPROVED));
                                    if (!mounted) return;
                                    Navigator.pushNamed(
                                        context, userActivityScreenRoute);
                                  },
                                ),
                              if (booking.bookingStatus == BookingStatus.APPROVED)
                                CustomTextButton(
                                  text: 'MARCA COM A RETORNADA',
                                  onClicked: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Eina retornada!')),
                                    );
                                    await ref
                                        .read(allBookingsProvider.notifier)
                                        .editBooking(booking.copyWith(
                                            bookingStatus:
                                                BookingStatus.RETURNED));
                                    if (!mounted) return;
                                    Navigator.pushNamed(
                                        context, userActivityScreenRoute);
                                  },
                                ),
                            ],
                          ),
                  ],
                ),
              ),
            ));
  }
}
