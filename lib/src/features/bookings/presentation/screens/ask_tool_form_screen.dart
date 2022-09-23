import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/bookings/presentation/widgets/date_picker_widget.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AskToolFormScreen extends ConsumerStatefulWidget {
  final ToolDetailArguments args;

  const AskToolFormScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _AskToolFormScreenState();
}

class _AskToolFormScreenState extends ConsumerState<AskToolFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _contactCtrl = TextEditingController();
  final _commentsCtrl = TextEditingController();
  //final _startDateCtrl = TextEditingController();
  //final _endDateCtrl = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tool = ref.watch(toolByIdProvider(widget.args.id));
    final start = dateRange.start;
    final end = dateRange.end;
    final totalDays = dateRange.duration;

    return Scaffold(
      appBar: UserAppbar('Formulari contacte'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Peticio enviada!')),
          );
          await ref
              .read(allBookingsProvider.notifier)

              ///New booking instance:
              .createBooking(BookingModel(
                bookingStatus: BookingStatus.ASKED,
                contact: _contactCtrl.text,
                comments: _commentsCtrl.text,
                reservedDates: dateRange,
                //startDate: startDate,
                //endDate: endDate,
                //userInfo:
              ));

          if (!mounted) return;
          Navigator.pushNamed(context, userActivityScreenRoute);
        },
        label: Text("Envia"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Demana la eina : ${tool.title}'),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _contactCtrl,
                labelText: "Especifica forma i dades de contacte",
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _commentsCtrl,
                maxLines: 5,
                labelText: "Pots afegir aqui comentaris adicionals",
              ),
              SizedBox(height: 20.0),
              Text("Selecciona les dades en que vols reservar:"),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('${start.day}/${start.month}/${start.year}'),
                      onPressed: pickDateRange,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('${end.day}/${end.month}/${end.year}'),
                      onPressed: pickDateRange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Dies en total: ${totalDays.inDays}"),
              // TextField(
              //     controller: _startDateCtrl,
              //     decoration: InputDecoration(
              //       icon: Icon(Icons.calendar_today),
              //       labelText: "Selecciona dia d'inici",
              //     ),
              //     readOnly: true,
              //     onTap: () async {
              //       DateTime? selectedDate = await showDatePicker(
              //         context: context,
              //         initialDate: startDate,
              //         firstDate: DateTime.now(),
              //         lastDate: DateTime(2040),
              //       );
              //       if (selectedDate != null) {
              //         startDate = selectedDate;
              //         String formatDate = getFormattedDate(selectedDate);
              //         setState(() {
              //           _startDateCtrl.text = formatDate;
              //         });
              //       }
              //     }),
              // TextField(
              //     controller: _endDateCtrl,
              //     decoration: InputDecoration(
              //       icon: Icon(Icons.calendar_today),
              //       labelText: "Selecciona dia de tornada",
              //     ),
              //     readOnly: true,
              //     onTap: () async {
              //       DateTimeRange? reservationDates = await showDateRangePicker(
              //         context: context,
              //         initialDateRange: dateRange,
              //         firstDate: DateTime.now(),
              //         lastDate: DateTime(2040),
              //       );
              //       if (reservationDates == null) return;
              //       setState(() {
              //         dateRange = reservationDates;
              //       });
              //     })
            ],
          ),
        ),
      ),
    );
  }

  pickDateRange() async {
    DateTimeRange? reservationDates = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    if (reservationDates == null) return;
    setState(() {
      dateRange = reservationDates;

    });
  }
}
