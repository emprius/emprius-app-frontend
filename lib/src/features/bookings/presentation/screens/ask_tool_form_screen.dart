import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/features/bookings/presentation/screens/widgets/date_picker_widget.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
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
  DateTime date = DateTime(2022, 8, 1);

  final _formKey =GlobalKey<FormState>();
  final _contactCtrl = TextEditingController();
  final _commentsCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tool = ref.watch(toolByIdProvider(widget.args.id));

    return Scaffold(
      appBar: UserAppbar('Formulari contacte'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Peticio enviada!')),
          );
          await ref
              .read(allBookingsProvider.notifier)
              .createBooking(BookingModel(
              bookingStatus: BookingStatus.ASKED,
              contact: _contactCtrl.text,
            comments: _commentsCtrl.text,
            //userInfo:
          ));

          if (!mounted) return;
          Navigator.pushNamed(
              context, userActivityScreenRoute);
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
              DatePickerWidget("Selecciona dia d'inici"),
              //TODO (m): pass data from widget > endDate and startDate
              Text('${date.year}/${date.month}/${date.day}'),
              DatePickerWidget("Selecciona data de tornada"),
              Text('${date.year}/${date.month}/${date.day}'),
            ],
          ),
        ),
      ),
    );
  }
}
