import 'package:empriusapp/views/widgets/common/custom_text_button.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:flutter/material.dart';

import '../../models/tool_model.dart';
import '../../utils/form_validator.dart';
import '../widgets/common/custom_textfield.dart';

class AddToolScreen extends StatefulWidget {
  const AddToolScreen({Key? key}) : super(key: key);

  @override
  createState() => _AddToolScreenState();
}

class _AddToolScreenState extends State<AddToolScreen> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
                CustomTextButton(text: 'Guarda', onClicked: () {}),
              ],
            ),
        ),
      ),
    );
  }
}
