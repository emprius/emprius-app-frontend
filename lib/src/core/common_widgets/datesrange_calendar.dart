import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/data/repositories/tool_http_repository.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Reservation {
  DateTime startDate;
  DateTime endDate;
  Reservation({required this.startDate, required this.endDate});
}

class DatesRangeCalendar extends StatefulWidget {
  final List<DateTimeRange> dateRanges;

  const DatesRangeCalendar({required this.dateRanges, Key? key}) : super(key: key);

  @override
  State<DatesRangeCalendar> createState() => _DatesRangeCalendarState();
}

class _DatesRangeCalendarState extends State<DatesRangeCalendar> {

  Reservation reservation = Reservation(
      startDate:  DateTime.now(),
      endDate:   DateTime(DateTime.now().day+5),
  );

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.enforced;

  @override
  void initState() {
    super.initState();
  }

  bool isSameDay(DateTime a, DateTime b){
    if (a == null || b == null) {
      return false;
    }
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  ///Checks if a day is between two days for UI display purposes:
  bool isInRange(DateTime day, DateTime start, DateTime end) {
    if (isSameDay(day, start) || isSameDay(day, end)) {
      return true;
    }
    if (day.isAfter(start) && day.isBefore(end)) {
      return true;
    }
    return false;
  }


  final rangeValidator = CalendarValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        focusedDay: _focusedDay,
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(Duration(days:365)),

        /// Function deciding whether given day should be marked as selected:
        selectedDayPredicate: (day) =>
            isSameDay(_selectedDay, day),
        rangeStartDay: reservation.startDate,
        rangeEndDay: reservation.endDate,

        calendarBuilders: CalendarBuilders(
          /// Custom builder for day cells, with a priority over any other builder:
        prioritizedBuilder: (context, day, focusedMonth) {
            //DateTimeRange? dateTimeRange = dayInRange(day);
            DateTimeRange? dateTimeRange = rangeValidator.getDayInRange(day, widget.dateRanges);


            ///If day is in any saved DateTimeRange (prior dayInRange) show a highlighted cell:
            if(dateTimeRange != null) {
              return LayoutBuilder(
                  builder:  (context, constraints) {
                    final shorterSide = constraints.maxHeight > constraints.maxWidth
                     ? constraints.maxWidth : constraints.maxHeight;

                    final children = <Widget>[];

                    /// Logic to define start and end range:
                    final isRangeStart = isSameDay(day, dateTimeRange.start);
                    final isRangeEnd = isSameDay(day, dateTimeRange.end);
                    final isWithinRange = isInRange(day, dateTimeRange.start, dateTimeRange.end);

                    if (isWithinRange) {
                      ///Paint highlight UI:
                      Widget rangeHighlight = Center(
                        child: Container(
                          margin: EdgeInsetsDirectional.only(
                            start: isRangeStart ? constraints.maxWidth * 0.5 : 0.0,
                            end: isRangeEnd ? constraints.maxWidth * 0.5 : 0.0,
                          ),
                          height: (shorterSide - EdgeInsets.all(6.0).vertical) * 1.0,
                        ),
                      );
                      children.add(rangeHighlight);
                    }

                    Widget? content;

                    if (isRangeStart) {
                      content = AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text('${day.day}', //style: style.rangeStartTextStyle
                        ),
                      );
                    } else if (isRangeEnd) {
                      content = AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text('${day.day}', // style: style.rangeEndTextStyle
                          )
                      );
                    } else if (isWithinRange) {
                      content = AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                              '${day.day}', //style: style.withinRangeTextStyle
                          )
                      );
                    }

                    if (content != null) children.add(content);

                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: children,
                      clipBehavior: Clip.hardEdge,
                    );
                  }
              );
            }
            return null;
          }
        ),

        onDaySelected: (selDay, focDay) {
          // if (!isSameDay(_selectedDay, selDay)) {
          //   setState(() {
          //     _selectedDay = _selectedDay;
          //     _focusedDay = focDay;
          //     // reservation.startDate = null; // Important to clean those
          //     // reservation.endDate = null;
          //     rangeSelectionMode =
          //         RangeSelectionMode.toggledOff;
          //   });
          // }
        },
        onRangeSelected: (start, end, focDay) {
          // setState(() {
          //  // _selectedDay = null;
          //   _focusedDay = focDay;
          //   reservation.startDate = start!;
          //   reservation.endDate = end!;
          //
          //   bool startDateInRange = false;
          //   bool endDateInRange = false;
          //
          //   DateTimeRange? range = dayInRange(reservation.startDate);
          //   if(range == null && reservation.endDate != null) {
          //     range = dayInRange(reservation.endDate);
          //     if(range != null)
          //       endDateInRange = true;
          //   } else if(range != null) {
          //     startDateInRange = true;
          //     if(reservation.endDate != null && dayInRange(reservation.endDate) != null)
          //       endDateInRange = true;
          //   }
          //
          //   //bool insertNewRange = true;
          //
          //   // if(startDateInRange) {
          //   //   if(isInRange(reservation.startDate, range.start, range.end)) {
          //   //     int index = dateRanges.indexOf(range);
          //   //     if(!endDateInRange && reservation.endDate != null)
          //   //       dateRanges[index] = DateTimeRange(start: reservation.startDate, end: reservation.endDate);
          //   //     else
          //   //       dateRanges[index] = DateTimeRange(start: reservation.startDate, end: range.end);
          //   //     insertNewRange = false;
          //   //   }
          //   // }
          //   //
          //   // if(endDateInRange) {
          //   //   if(isInRange(reservation.endDate, range.start, range.end)) {
          //   //     print("enddate is not null and is in range");
          //   //     int index = dateRanges.indexOf(range);
          //   //     dateRanges[index] = DateTimeRange(start: reservation.startDate, end: reservation.endDate);
          //   //     insertNewRange = false;
          //   //   }
          //   // }
          //
          //   // if(reservation.startDate != null && reservation.endDate != null && insertNewRange) {
          //   //   dateRanges.add(
          //   //       DateTimeRange(start: reservation.startDate, end: reservation.endDate));
          //   // }
          //
          // });
        },

        /// Called whenever currently visible calendar page is changed:
        onPageChanged: (focDay) {
          _focusedDay = focDay;
        },
      ),
    );
  }
}
