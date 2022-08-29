import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
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

  var _currentTransport = TransportOptions.NOT_NECESSARY;
  var _currentCategory = ToolCategory.VEHICLE;
  late bool _maybeFree = true;
  late bool _askWithFee = true;
  //TODO implement?
  late bool _isAvailable = true;
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
                        keyboardType: TextInputType.number,
                      ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          CheckboxListTile(
                              title: Text("Gratuita"),
                              value: _maybeFree,
                              onChanged: (value) {
                                setState(() {
                                  _maybeFree = value as bool;
                                });
                              }),
                          CheckboxListTile(
                              title: Text("Amb fiansa"),
                              value: _askWithFee,
                              onChanged: (value) {
                                setState(() {
                                  _askWithFee = value as bool;
                                });
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Tria categoria:"),
                SizedBox(height: 10.0),
                DropdownButton<ToolCategory>(
                  value: _currentCategory,
                  items: ToolCategory.values
                      .map(
                        (ToolCategory category) => DropdownMenuItem<ToolCategory>(
                          value: category,
                          child: Text(category.displayName!),
                        ),
                      )
                      .toList(),
                  onChanged: (ToolCategory? value) {
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
                DropdownButton<TransportOptions>(
                  value: _currentTransport,
                  items: TransportOptions.values
                      .map(
                        (TransportOptions transport) => DropdownMenuItem<TransportOptions>(
                      value: transport,
                      child: Text(transport.displayName!),
                    ),
                  )
                      .toList(),
                  onChanged: (TransportOptions? transportChosen) {
                    if (transportChosen != null && _currentTransport != transportChosen) {
                      setState(() {
                        _currentTransport = transportChosen;
                      });
                    }
                  },
                ),
              ]),
              SizedBox(height: 5.0),
              Container(
                //height: 200,
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
                        maybeFree: _maybeFree,
                        askWithFee: _askWithFee,
                        toolCategory: _currentCategory,
                        transportOptions: _currentTransport,
                        cost: int.parse(_costCtrl.text),
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
  }
}