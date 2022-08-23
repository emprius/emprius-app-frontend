import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/screens/tool_card_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserToolList extends ConsumerStatefulWidget {
  const UserToolList({
    Key? key,
  }) : super(key: key);

  @override
  createState() => _UserToolListState();
}

class _UserToolListState extends ConsumerState<UserToolList> {

  late bool isAvailable;
  void _deleteTool(ToolModel tool) {
    ref.watch(ownToolsProvider.notifier).deleteTool(tool);
  }

  @override
  void initState() {
    ref.read(ownToolsProvider.notifier).getOwnTools();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tools = ref.watch(ownToolsProvider);

    return Scaffold(
      appBar: UserAppbar("Les meves eines"),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () { Navigator.pushNamed(context, toolAddFormScreenRoute); },
        label: Text('Afegir eina'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: tools.length,
          itemBuilder: (context, index) {
            final tool = tools[index];
            return ListTile(
              title: Text(tool.title),
              subtitle: Text(tool.description),
              leading: Switch(
                value: tool.isAvailable,
                activeTrackColor: Colors.white10,
                activeColor: Colors.blue,
                onChanged: (value) {
                 ref.watch(ownToolsProvider.notifier).updateTool(tool.copyWith(isAvailable: value));
                },
              ),
              trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopupMenuButton(
                      //TODO on selected go to editpage
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: tool,
                          child: Text("Editar eina"),
                        ),
                      ],
                      icon: Icon(Icons.edit),
                    ),
                    PopupMenuButton(
                      onSelected:  _deleteTool,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: tool,
                            child: Text("Esborrar de la llista?"),
                          ),
                        ],
                        icon: Icon(Icons.delete),
                    ),
                  ]),
              onTap: () {
                //TODO cambiar a navigator:

                //Navigator.pushNamed(context, toolCardScreenRoute, args);


                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> ToolCardScreen(
                      //TODO pass tool id only - using .family provider on toolcardscreen
                      //TODO args tool id in routes
                      tool: tool,
                        // tool: ToolModel(
                        //   id: tool.id,
                        //   title: tool.title,
                        //   description: tool.description, maybeFree: tool.maybeFree, cost: tool.cost, needsTransport: tool.needsTransport, location: tool.location,
                        )
                    ));},
                //   ),
                // );
            );
          },
        ),
      ),
    );
  }
}
