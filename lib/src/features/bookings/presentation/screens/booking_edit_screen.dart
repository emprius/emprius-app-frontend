import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
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

class BookingEditScreen extends ConsumerStatefulWidget {
  final BookingDetailArguments args;
  const BookingEditScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _BookingEditScreenState();
}

class _BookingEditScreenState extends ConsumerState<BookingEditScreen> {
  DateTime date = DateTime(2022, 8, 1);

  final _formKey =GlobalKey<FormState>();
  final _contactCtrl = TextEditingController();
  final _commentsCtrl = TextEditingController();

  late BookingModel? booking;

  @override
  void initState() {
    booking = ref.read(bookingByIdProvider(widget.args.bookingId));
   _contactCtrl.text = booking!.contact;
   _commentsCtrl.text = booking!.comments!;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
     booking = ref.watch(bookingByIdProvider(widget.args.bookingId));

    return Scaffold(
      appBar: UserAppbar('Canviar peticio',),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Canvis desats')),
          );
          await ref.watch(allBookingsProvider.notifier).editBooking(booking!);
          if (!mounted) return;
          Navigator.of(context).pop();
        },
        label: Text("Guardar canvis"),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  labelText: "Canviar forma i dades de contacte",
                  onChanged: (value){
                    booking = booking!.copyWith(contact: value);
                  },
                  controller: _contactCtrl,
                  hintText: booking?.contact,
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  controller: _commentsCtrl,
                  maxLines: 5,
                  labelText: "Pots afegir aqui comentaris adicionals",
                  hintText: booking?.comments,
                ),
                const SizedBox(height: 20.0),
                //TODO (m): pass data from widget > endDate and startDate
                CustomTextField(
                    labelText: 'Dia inici', hintText: '${date.year}/${date.month}/${date.day}'),
                const SizedBox(height: 20.0),
                CustomTextField(
                    labelText: 'Dia de tornada', hintText: '${date.year}/${date.month}/${date.day}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
