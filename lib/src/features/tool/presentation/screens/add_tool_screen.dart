import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToolScreen extends ConsumerStatefulWidget {
  const AddToolScreen({Key? key}) : super(key: key);

  @override
  createState() => _AddToolScreenState();
}

class _AddToolScreenState extends ConsumerState<AddToolScreen> {
  String? currentValue = "";
  List<String> categories = ["Vehicle", "Construccio", "Energia"];
  List<String> price = ["Gratuita", "Amb fiansa"];
  List<bool> isChecked = [];

  late ToolModel tool;

  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  late bool isAvailable = true;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    currentValue = categories[0];
    isChecked = List<bool>.filled(price.length, false);
    //TODO CHECK PROVIDER
//    tool = ref.read(toolListProvider.notifier).state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppbar('Afegir eines'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Afegeix nova eina:'),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _titleCtrl,
                validator: FormValidator.nameValidator,
                labelText: "Nom de la eina",
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _descriptionCtrl,
                validator: FormValidator.nameValidator,
                labelText: "Descripcio de la eina",
                maxLines: 5,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Puja fotos"),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Puja fotos"),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text("Tria categoria:"),
                DropdownButton(
                  value: currentValue,
                  items: categories
                      .map((String category) => DropdownMenuItem<String>(
                          value: category, child: Text(category)))
                      .toList(),
                  onChanged: (String? value) {
                    if (value != null && currentValue != value) {
                      setState(() {
                        currentValue = value;
                      });
                    }
                  },
                ),
              ]),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: price.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                        title: Text(price[index]),
                        value: isChecked[index],
                        onChanged: (value) {
                          setState(() {
                            isChecked[index] = value as bool;
                          });
                        });
                  }),
              const SizedBox(height: 20.0),
              CustomTextButton(
                text: 'Guarda',
                onClicked: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Eina afegida')),
                  );

                  await ref
                      .watch(toolListProvider.notifier)
                      .updateTool(tool.copyWith(
                        title: _titleCtrl.text,
                        description: _descriptionCtrl.text,
                       ));

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
