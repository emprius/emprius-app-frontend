import 'package:empriusapp/src/core/common_widgets/custom_textfield.dart';
import 'package:empriusapp/src/core/common_widgets/image_list_selector.dart';
import 'package:empriusapp/src/core/helper/utils/form_validator.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
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
    tool = ref.read(toolByIdProvider(widget.args.id));
    _titleCtrl.text = tool!.title;
    _descriptionCtrl.text = tool!.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppbar(title: 'Editar eina',),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Desar canvis"),
        onPressed: () async {
          //TODO check validate only one field
          if (!_formKey.currentState!.validate()) {
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Eina editada')),
          );
          await ref.watch(allToolsProvider.notifier).updateTool(tool!);
          if (!mounted) return;
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
                  onChanged: (value) {
                    tool = tool!.copyWith(title: value);
                  },
                  hintText: tool?.title,
                  controller: _titleCtrl,
                  validator: FormValidator.nameValidator,
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  onChanged: (value) => tool = tool!.copyWith(description: value),
                  labelText: "Cambiar descripcio:",
                  hintText: tool?.description,
                  controller: _descriptionCtrl,
                  maxLines: 5,
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: CustomTextField(
                        controller: _costCtrl,
                        onChanged: (value) => tool = tool!.copyWith(cost: int.parse(value)),
                        labelText: "Cost per dia",
                        keyboardType: TextInputType.number,
                        hintText: tool?.cost.toString(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CheckboxListTile(
                              title: Text("Gratuita"),
                              value: tool?.maybeFree,
                              onChanged: (value) {
                                setState(() {
                                  tool = tool?.copyWith(maybeFree: value);
                                });
                              }),
                          CheckboxListTile(
                              title: const Text("Amb fiansa"),
                              value: tool?.askWithFee,
                              onChanged: (value) {
                                setState(() {
                                  tool = tool?.copyWith(askWithFee: value);
                                });
                              })
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 30.0,
                          child: (tool?.toolCategory as ToolCategory).label
                              as Widget),
                      const SizedBox(width: 25),
                      Column(
                        children: [
                          const Text("Cambiar categoria:"),
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
                        ],
                      ),
                    ]),
                const SizedBox(height: 10.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Opcions \nde transport:"),
                      const SizedBox(width: 25),
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
                const SizedBox(height: 10.0),
                const Divider(
                  height: 20,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.black,
                ),
                if(tool?.images !=null)
                  Column(
                    children: [
                      ImageListSelector(
                        text: 'Cambiar fotografies',
                        toolImageList: tool!.images,
                        callback: ((selectedImages) => tool = tool!.copyWith(images: selectedImages))),
                    ]
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
