import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/features/tool/application/providers/deprecated_tool_provider.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/core/common_widgets/image_list_selector.dart';
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
  late bool isAvailable = true;

  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();

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
              SizedBox(height: 20.0),
              Text('Afegeix nova eina:'),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _titleCtrl,
                validator: FormValidator.nameValidator,
                labelText: "Titol de la eina",
              ), // Titol eina
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _descriptionCtrl,
                validator: FormValidator.nameValidator,
                labelText: "Descripcio de la eina",
                maxLines: 5,
              ), // Descripcio eina
              SizedBox(height: 20.0),
              SizedBox(height: 20.0),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Tria categoria:"),
                    DropdownButton(
                      value: currentValue,
                      items: categories
                          .map(
                            (String category) => DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        if (value != null && currentValue != value) {
                          setState(() {
                            currentValue = value;
                          });
                        }
                      },
                    ),
                  ]), //Categories
              Container(
                child: ListView.builder(
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
              ), // Checkbox preu
              const SizedBox(height: 20.0),
              Container(height: 180, child: ImageListSelector()), //
              CustomTextButton(
                text: 'Guarda',
                onClicked: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Eina afegida')),
                  );

                  await ref.read(ownToolsProvider.notifier).addTool(
                      //TODO (m) implement more fields coming from add tool screen
                      title: _titleCtrl.text,
                      description: _descriptionCtrl.text);
                  // .updateTool(tool.copyWith(
                  //   title: _titleCtrl.text,
                  //   description: _descriptionCtrl.text,
                  //  ));

                  Navigator.of(context).pop();
                },
              ), // Guardar
            ],
          ),
        ),
      ),
    );
    //);
  }
}
