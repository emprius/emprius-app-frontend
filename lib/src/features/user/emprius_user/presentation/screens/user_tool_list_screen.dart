import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/screens/tool_detail_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserToolList extends ConsumerStatefulWidget {
  // final EditToolArguments args;
  // const UserToolList(this.args, {Key? key}) : super(key: key);

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
                      icon: Icon(Icons.edit),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: tool,
                          child: Text("Editar eina"),
                        ),
                      ],
                      onSelected: (value){
                        if(value == tool) {
                          Navigator.pushNamed(context, toolEditCardScreenRoute,
                              arguments: EditToolArguments(tool.id!));
                        }
                        },
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.delete),
                      onSelected:  _deleteTool,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: tool,
                            child: Text("Esborrar de la llista?"),
                          ),
                        ],
                    ),
                  ]),
              onTap: () {
                Navigator.pushNamed(context, toolDetailScreenRoute, arguments: ToolDetailArguments(tool.id!));
              },
            );
          },
        ),
      ),
    );
  }
}
