import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/data/mocked/mocked_bookings_service.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:empriusapp/src/features/bookings/domain/user_info/user_info_model.dart';
import 'package:empriusapp/src/features/bookings/presentation/widgets/date_picker_widget.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
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
  DateTimeRange? dateRange;
  // DateTimeRange(start: DateTime.now(), end: DateTime.now());


  final rangeValidator = CalendarValidator();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tool = ref.watch(toolByIdProvider(widget.args.id));
    final start = dateRange?.start;
    final end = dateRange?.end;
    final totalDays = dateRange?.duration;
    final bookedRanges = tool.reservedDates;

    return Scaffold(
      appBar: UserAppbar(title: 'Formulari contacte',),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {

          await ref
              .read(allBookingsProvider.notifier)
              .createBooking(BookingModel(
            bookingStatus: BookingStatus.ASKED,
            contact: _contactCtrl.text,
            comments: _commentsCtrl.text,
            reservedDates: dateRange,
            // fromUserId: ref.read(userProvider).id,
            fromUserId: 1,
            // toUserId: tool.userId,
            toUserId: 2,
            toolId: tool.id,
            startDate: startDate,
            endDate: endDate,
            userInfo: UserInfo(name: "Mocked1", rating: 5, avatar: sampleAvatars[0]),
          ));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Peticio enviada!')),
          );

          if (!mounted) return;
          Navigator.pop(context);
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
                      child: start == null ? Icon(Icons.calendar_today) : Text('${start.day}/${start.month}/${start.year}'),
                      onPressed: () => pickDateRange(bookedRanges),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      child:  end == null ? Icon(Icons.calendar_today) : Text('${end.day}/${end.month}/${end.year}'),
                      onPressed: () {
                        pickDateRange(bookedRanges);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if(totalDays !=null) Text("Dies en total: ${totalDays.inDays}"),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickDateRange(List<DateTimeRange> bookedRanges) async {

    DateTimeRange? reservationDates = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    if (reservationDates != null) {

      rangeValidator.isSelectedRangeInBookedRange(
          reservationDates, bookedRanges)
          ? rangeValidator.showRangeErrorDialog(context)

     : setState(() {
          dateRange = reservationDates;
        });


    }
  }

}
