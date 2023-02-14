import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/skeleton/booking_list_tile.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingListSkeleton extends ConsumerStatefulWidget {
  final List<BookingModel> bookings;
  final String appbarTitle;
  final Future<void> Function() onRefresh;

  const BookingListSkeleton({
    Key? key,
    required this.onRefresh,
    required this.bookings,
    required this.appbarTitle,
  }) : super(key: key);

  @override
  createState() => _BookingListSkeletonState();
}

class _BookingListSkeletonState extends ConsumerState<BookingListSkeleton> {
  var isSelected = <bool>[false, false, false];

  void toggleOnPressed(int index) {
    if (index == 0) {
      ref.read(bookingFilterProvider.state).state = BookingStatus.ASKED;
    } else if (index == 1) {
      ref.read(bookingFilterProvider.state).state = BookingStatus.APPROVED;
    } else if (index == 2) {
      ref.read(bookingFilterProvider.state).state = BookingStatus.RETURNED;
    } else if (index == 3) {
      ref.read(bookingFilterProvider.state).state = BookingStatus.ALL;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(bookingFilterProvider);

    switch (filterState) {
      case BookingStatus.RETURNED:
        isSelected = <bool>[false, false, true, false];
        break;
      case BookingStatus.APPROVED:
        isSelected = <bool>[false, true, false, false];
        break;
      case BookingStatus.ASKED:
        isSelected = <bool>[true, false, false, false];
        break;
      case BookingStatus.ALL:
      default:
        isSelected = <bool>[false, false, false, true];
    }

    var bookings = widget.bookings;

    return Scaffold(
      appBar: UserAppbar(widget.appbarTitle,),
      drawer: UserDrawer(),
      body: RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            leadingWidth: 0.0,
            backgroundColor: Colors.transparent,
            title: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                    color: Colors.black.withOpacity(0.60),
                    selectedColor: Color(0xFF606042),
                    selectedBorderColor: Color(0xFF606042),
                    fillColor: Color(0xFF606042).withOpacity(0.08),
                    splashColor: Color(0xFF606042).withOpacity(0.12),
                    hoverColor: Color(0xFF606042).withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4.0),
                    constraints: BoxConstraints(minHeight: 36.0),
                    isSelected: isSelected,
                    onPressed: toggleOnPressed,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('PENDENTS'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('EN CURS'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('RETORNADES'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('TOTES'),
                      ),
                    ]),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: bookings.isEmpty ? 1 : bookings.length,
                (context, index) {
              //final booking = bookings[index];
              //final tool = ref.watch(toolByIdProvider(booking.toolId!));
              return bookings.isEmpty
                  ? const Center(
                      child: Text('No hi ha eines en aquesta categoria'))
                  : Column(
                      children: [
                        BookingListTile(
                            bookings[index],
                            ref.watch(
                                toolByIdProvider(bookings[index].toolId!))),
                        Divider(),
                        if (bookings.isEmpty)
                          const Center(
                              child:
                                  Text('No hi ha eines en aquesta categoria'))
                      ],
                    );
            }),
          ),
        ]),
      ),
    );
  }
}
