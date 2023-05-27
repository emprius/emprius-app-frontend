import 'package:flutter/material.dart';

String getFormattedDate(DateTime date){
  return "${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year.toString()}";
}

class CalendarValidator {

  DateTimeRange? getDayInRange(DateTime day, List<DateTimeRange> ranges) {
    List<DateTimeRange> list = ranges.where((element) =>
    element.start.isBefore(day) && element.end.isAfter(day) ||
        element.start.year == day.year && element.start.day == day.day &&
            element.start.month == day.month ||
        element.end.year == day.year && element.end.day == day.day &&
            element.end.month == day.month).toList();
    return list.isNotEmpty ? list[0] : null;
  }

  bool isDayInRange(DateTime day, List<DateTimeRange> ranges) =>
      getDayInRange(day, ranges) != null;


 bool isSelectedRangeInBookedRange(DateTimeRange selectedRange, List<DateTimeRange> bookedRanges) {
   var first = selectedRange.start;
   var last = selectedRange.end;
   List<DateTime> daysToCheck = [];

   for(int i=0; i <= last.difference(first).inDays; i++){
     daysToCheck.add(first.add(Duration(days: i)));
   }

   for(var day in daysToCheck) {
     if(isDayInRange(day, bookedRanges)) return true;
   }

   return false;
 }

 showRangeErrorDialog(BuildContext context) async {
   return await showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           actions: [
             TextButton(
               child: const Text(
                   "Una o mes dates ja estan reservades!",
             style: TextStyle(color: Colors.redAccent)),
               onPressed: () { Navigator.of(context).pop(); },
             ),
           ],
         );
       });
 }

}