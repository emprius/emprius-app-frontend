import 'package:empriusapp/views/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/common/custom_textfield.dart';
import '../widgets/user_appbar.dart';

class AskToolFormScreen extends StatefulWidget {
  const AskToolFormScreen({Key? key}) : super(key: key);

  @override
  State<AskToolFormScreen> createState() => _AskToolFormScreenState();
}

class _AskToolFormScreenState extends State<AskToolFormScreen> {
  DateTime date = DateTime(2022, 8, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppbar('Formulari contacte'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        physics: const BouncingScrollPhysics(),
        child: Form(
          //key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Demana la eina XXXXX:'),
              SizedBox(height: 20.0),
              CustomTextField(
                //controller: _petitionCtrl,
                labelText: "Explica breument per a que la vols",
                maxLines: 5,
              ),
              SizedBox(height: 20.0),
              DatePickerWidget("Selecciona dia d'inici"),
              //todo: pass data from widget
              Text('${date.year}/${date.month}/${date.day}'),
              DatePickerWidget("Selecciona data de tornada"),
            ],
          ),
        ),
      ),
    );
  }
}
