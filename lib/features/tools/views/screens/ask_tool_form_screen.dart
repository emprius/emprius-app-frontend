import 'package:empriusapp/core/routes.dart';
import 'package:empriusapp/core/widgets/common/custom_textfield.dart';
import 'package:empriusapp/core/widgets/common/date_picker_widget.dart';
import 'package:empriusapp/features/tools/models/tool_model.dart';
import 'package:empriusapp/features/user/views/widgets/user_appbar.dart';
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
  late ToolModel tool;

  @override
  void initState() {
    tool = widget.args.tool;
    super.initState();
  }

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
              Text('Demana la eina ${tool.title}'),
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
