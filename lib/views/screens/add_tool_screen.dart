import 'package:empriusapp/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    currentValue = categories[0];
    isChecked = List<bool>.filled(price.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afegir eines'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0.0),
        child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Afegeix nova eina:'),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nom de l'eina"),
                  validator: (value) {
                    if (value?.length == 0) {
                      return "Siusplau afegeix el nom de l'eina";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                  const InputDecoration(labelText: "Afegeix descripcio"),
                  validator: (value) {
                    if (value?.length == 0) {
                      return "Siusplau afegeix la descripcio l'eina";
                    }
                    return null;
                  },
                ),
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
                /*Column(children: [
              Text(isChecked.toString()),
              ListView.builder(
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
            ]),*/
                const SizedBox(height: 20.0),
                ButtonWidget(text: 'Guarda', onClicked: () {}),
              ],
            )),
      ),
    );
  }
}
