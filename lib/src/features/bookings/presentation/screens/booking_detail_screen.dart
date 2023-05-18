import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/constants/asset_or_file_image.dart';
import 'package:empriusapp/src/core/helper/constants/date_utils.dart';
import 'package:empriusapp/src/core/helper/constants/widget_spacing.dart';
import 'package:empriusapp/src/core/config/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
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
    const double padding = 20;

    return Scaffold(
            appBar: UserAppbar("Reserva"),
            body:Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/4.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: assetOrFileImage(tool.images![0]),
                        opacity: 0.8,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                            TextSpan(
                                children: [
                                  WidgetSpan(child: (booking.bookingStatus).label as Widget),
                                  TextSpan(text: 'Eina reservada :',
                                    style: TextStyle(color: Theme.of(context).backgroundColor),
                                  ),
                                ]
                            ),),
                        Text(
                          tool.title,
                          style: (Theme.of(context)
                              .textTheme.headline1?.merge(TextStyle(color: Theme.of(context).backgroundColor))
                          ),),
                      ],),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: padding),
                          child: Text(booking.comments!,)),
                      addVerticalSpace(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: padding),
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVerticalSpace(20),
                            const Text("Dates transaccio:",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            addVerticalSpace(10),
                            Container(
                              padding: EdgeInsets.all(6.0),
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 0.5),
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
                              child:
                              Row(mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.calendar_month_outlined),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                          "${getFormattedDate(booking.reservedDates!.start)} : ${getFormattedDate(booking.reservedDates!.end)} "),
                                    ),
                                  ]),
                            ),
                          ],),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Dades usuari:",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            addVerticalSpace(10),
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
                                    //style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                                  ),
                                  RatingStars(rating: booking.userInfo!.rating!),
                                ],
                              ),
                              subtitle: Text(booking.contact),
                            )
                          ],),
                      ),
                  ]),
                ),
                booking.bookingStatus == BookingStatus.RETURNED
                    ? Container()
                    : ButtonBar(
                  alignment: MainAxisAlignment.center,
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
                  ],)
              ],),
    );
  }
}