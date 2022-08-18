import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {

  String dateTitle;
  DatePickerWidget(this.dateTitle);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date = DateTime(2022, 8, 1);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(widget.dateTitle),
        onPressed: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2022),
            lastDate: DateTime(2040),
          );
          if (selectedDate == null) return;
          setState(()=> date = selectedDate);
        }
    );
  }

}