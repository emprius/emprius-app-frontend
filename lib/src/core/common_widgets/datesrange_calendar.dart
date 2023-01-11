import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
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
      padding: const EdgeInsets.all(35.0),
      child: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        focusedDay: _focusedDay,
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days:365)),

        /// Function deciding whether given day should be marked as selected:
        selectedDayPredicate: (day) =>
            isSameDay(_selectedDay, day),
        rangeStartDay: reservation.startDate,
        rangeEndDay: reservation.endDate,

        calendarBuilders: CalendarBuilders(
          /// Custom builder for day cells, with a priority over any other builder:
        prioritizedBuilder: (context, day, focusedMonth) {
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
                          height: (shorterSide - const EdgeInsets.all(6.0).vertical) * 1.0,
                          color: Colors.blueAccent,
                        ),
                      );
                      children.add(rangeHighlight);
                    }

                    Widget? content;

                    if (isRangeStart) {
                      content = AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF6699FF),
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
                          decoration: const BoxDecoration(
                            color: Color(0xFF6699FF),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text('${day.day}', // style: style.rangeEndTextStyle
                          )
                      );
                    } else if (isWithinRange) {
                      content = AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.all(6.0),
                          decoration: const BoxDecoration(
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
                      clipBehavior: Clip.hardEdge,
                      children: children,
                    );
                  }
              );
            }
            return null;
          }
        ),

        /// Called whenever currently visible calendar page is changed:
        onPageChanged: (focDay) {
          _focusedDay = focDay;
        },
      ),
    );
  }
}
