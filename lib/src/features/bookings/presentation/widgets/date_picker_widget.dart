// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class DatePickerWidget extends StatefulWidget {
//
//   TextEditingController startDateCtrl;
//   String dateTitle;
//
//   DatePickerWidget({
//     this.dateTitle,
//     this.startDateCtrl
//   });
//
//   @override
//   State<DatePickerWidget> createState() => _DatePickerWidgetState();
// }
//
// class _DatePickerWidgetState extends State<DatePickerWidget> {
//   DateTime date = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         child: Text(widget.dateTitle),
//         onPressed: () async {
//           DateTime? selectedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             //initialDate: date,
//             firstDate: DateTime.now(),
//             lastDate: DateTime(2040),
//           );
//           // if (selectedDate == null) return;
//           // setState(()=> date = selectedDate);
//           if(selectedDate != null ){
//            //String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
//             //print(formattedDate); //formatted date output using intl package =>  2022-07-04
//             setState(() {
//               //_startDateCtrl.text = formattedDate;
//              date = selectedDate; //set foratted date to TextField value.
//             });
//           }else{
//             print("Date is not selected");
//           }
//         }
//     );
//   }
//
// }