import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/core/common_widgets/image_list_selector.dart';
import 'package:empriusapp/src/features/tool/presentation/widgets/tool_extra_properties.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddToolScreen extends ConsumerStatefulWidget {
  const AddToolScreen({Key? key}) : super(key: key);

  @override
  createState() => _AddToolScreenState();
}

class _AddToolScreenState extends ConsumerState<AddToolScreen> {
  String? _currentCategory = "";
  List<String> categories = ["Vehicle", "Construccio", "Energia"];

  String? _currentTransport = "";
  List<String> transportOptions = [
    "Cap en especial",
    "Necessita remolc",
    "Necessita vehicle pesat"
  ];

  List<String> price = ["Gratuita", "Amb fiansa"];
  List<bool> isChecked = [];

  late bool isAvailable = true;
  List<XFile>? _images;

  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _costCtrl = TextEditingController();

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descriptionCtrl.dispose();
    _costCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _currentCategory = categories[0];
    _currentTransport = transportOptions[0];
    isChecked = List<bool>.filled(price.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppbar('Afegir eia'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    //height: 150,
                    width: 150,
                    child: CustomTextField(
                        controller: _costCtrl,
                        labelText: "Cost per dia",
                      ),
                  ),
                  Expanded(
                      child: ListView.builder(
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
                  })),
                ],
              ),
              SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Tria categoria:"),
                SizedBox(height: 10.0),
                DropdownButton(
                  value: _currentCategory,
                  items: categories
                      .map(
                        (String category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {
                    if (value != null && _currentCategory != value) {
                      setState(() {
                        _currentCategory = value;
                      });
                    }
                  },
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Opcions \nde transport:"),
                SizedBox(height: 10.0),
                DropdownButton(
                  value: _currentTransport,
                  items: transportOptions
                      .map(
                        (String transport) => DropdownMenuItem<String>(
                          value: transport,
                          child: Text(transport),
                        ),
                      )
                      .toList(),
                  onChanged: (String? transport) {
                    if (transport != null && _currentTransport != transport) {
                      setState(() {
                        _currentTransport = transport;
                      });
                    }
                  },
                ),
              ]),
              SizedBox(height: 5.0),
              Container(
                height: 200,
                child: ImageListSelector(
                    callback: ((selectedImages) => _images = selectedImages)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextButton(
                      text: "Altres caracteristiques",
                      onClicked: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => ToolExtraProperties()));
                      }),
                  CustomTextButton(
                    text: "Guarda",
                    onClicked: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Eina afegida')),
                      );

                      await ref
                          .read(ownToolsProvider.notifier)
                          .addTool(ToolModel(
                            title: _titleCtrl.text,
                            description: _descriptionCtrl.text,
                            images: _images?.map((e) => e.path).toList(),
                          ));
                      //Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(
                          context, userToolsScreenRoute);
                    },
                  )
                ],
              ) //
            ],
          ),
        ),
      ),
    );
    //);
  }
}
