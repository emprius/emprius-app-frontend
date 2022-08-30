import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/widgets/tool_caroussel.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolEditCardScreen extends ConsumerStatefulWidget {
  final EditToolArguments args;

  const ToolEditCardScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _ToolEditCardScreenState();
}

class _ToolEditCardScreenState extends ConsumerState<ToolEditCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _costCtrl = TextEditingController();
  late ToolModel? tool;

  @override
  void initState() {
    tool = ref.read(singleToolProvider(widget.args.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final tool = ref.watch(singleToolProvider(widget.args.id));

    return Scaffold(
      appBar: UserAppbar("Editar eina"),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Desar canvis"),
        onPressed: () async {
          //TODO check validation
          // if (!_formKey.currentState!.validate()) {
          //   return;
          // }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Eina editada')),
          );
          await ref.watch(ownToolsProvider.notifier).updateTool(tool!);
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
                CustomTextField(
                  labelText: "Cambiar el titol:",
                  hintText: tool?.title,
                  controller: _titleCtrl,
                  validator: FormValidator.nameValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 10.0),
                CustomTextField(
                  labelText: "Cambiar descripcio:",
                  hintText: tool?.description,
                  controller: _descriptionCtrl,
                  validator: FormValidator.nameValidator,
                  //TODO (m) check validate only one field
                  // validator:  (value) {
                  //   if (value == null || value.isEmpty) {
                  //   return null;
                  //   }else {
                  //     FormValidator.nameValidator;
                  //   }
                  //   },
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 5,
                ),
                SizedBox(height: 10.0),
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
                        hintText: tool?.cost.toString(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            CheckboxListTile(
                                title: Text("Gratuita"),
                                value: tool?.maybeFree,
                                onChanged: (value) {
                                  setState(() {
                                    tool = tool?.copyWith(maybeFree: value);
                                    // ?.maybeFree = value as bool;
                                  });
                                }),
                            CheckboxListTile(
                                title: Text("Amb fiansa"),
                                value: tool?.askWithFee,
                                onChanged: (value) {
                                  setState(() {
                                    tool = tool?.copyWith(askWithFee: value);
                                  });
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 30.0,
                          child: (tool?.toolCategory as ToolCategory).label
                              as Widget),
                      Text("Cambiar categoria:"),
                      DropdownButton<ToolCategory>(
                        value: tool?.toolCategory,
                        items: ToolCategory.values
                            .map(
                              (ToolCategory category) =>
                                  DropdownMenuItem<ToolCategory>(
                                value: category,
                                child: Text(category.displayName!),
                              ),
                            )
                            .toList(),
                        onChanged: (ToolCategory? value) {
                          if (value != null && tool?.toolCategory != value) {
                            setState(() {
                              tool = tool?.copyWith(toolCategory: value);
                            });
                          }
                        },
                      ),
                    ]),
                SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Opcions \nde transport:"),

                      DropdownButton<TransportOptions>(
                        value: tool?.transportOptions,
                        items: TransportOptions.values
                            .map(
                              (TransportOptions transport) =>
                                  DropdownMenuItem<TransportOptions>(
                                value: transport,
                                child: Text(transport.displayName!),
                              ),
                            )
                            .toList(),
                        onChanged: (TransportOptions? transportChosen) {
                          if (transportChosen != null &&
                              tool?.transportOptions != transportChosen) {
                            setState(() {
                              tool = tool?.copyWith(
                                  transportOptions: transportChosen);
                            });
                          }
                        },
                      ),
                    ]),
                //if(tool?.images !=null)ToolCaroussel(tool?.images),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
