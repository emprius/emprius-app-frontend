import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/widgets/tool_caroussel.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ToolEditCardScreen extends ConsumerStatefulWidget {
  final EditToolArguments args;
  const ToolEditCardScreen(this.args, {Key? key} ) : super(key: key);

  @override
  createState() => _ToolEditCardScreenState();
}

class _ToolEditCardScreenState extends ConsumerState<ToolEditCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final tool = ref.watch(singleToolProvider(widget.args.id));

    return Scaffold(
      appBar: UserAppbar("Editar eina"),

      floatingActionButton: FloatingActionButton.extended(
        label: Text("Desar canvis"),
        onPressed: () async{
          if (!_formKey.currentState!.validate()) {
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Eina editada')),
          );
          await ref.watch(ownToolsProvider.notifier).updateTool(tool!.copyWith(
            title: _titleCtrl.text,
            description: _descriptionCtrl.text,
           ));
          Navigator.of(context).pop();

        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text("Cambiar el titol:"),
                CustomTextField(
                    labelText: tool!.title,
                    controller: _titleCtrl,
                    validator: FormValidator.nameValidator),
                SizedBox(height: 10.0),
                //TODO (m) extract to list of labels dynamic
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Transport'),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.car_rental,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 6.0),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Eines'),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.handyman,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                ),
                SizedBox(height: 10.0),
                ToolCaroussel(),
                SizedBox(height: 20.0),
                const Text("Cambiar descripcio:"),
                SizedBox(height: 10.0),
                CustomTextField(labelText: tool.description,

                  controller: _descriptionCtrl,
                  validator: FormValidator.nameValidator,
                  maxLines: 5,),


                // Padding(
                //   padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                //   child: Text(
                //     tool.description,
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                //TODO (m) checkbox for if needs transport
                // ListView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: needsTransport.length,
                //     itemBuilder: (context, index) {
                //       return CheckboxListTile(
                //           title: Text(needsTransport[index]),
                //           value: isChecked[index],
                //           onChanged: (value) {
                //             setState(() {
                //               isChecked[index] = value as bool;
                //             });
                //           });
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
