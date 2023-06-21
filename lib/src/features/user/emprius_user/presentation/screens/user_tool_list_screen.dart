import 'package:empriusapp/src/core/config/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/screens/tool_detail_screen.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/auth_user/providers/auth_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserToolList extends ConsumerStatefulWidget {
  @override
  createState() => _UserToolListState();
}

class _UserToolListState extends ConsumerState<UserToolList> {
  late bool isAvailable;


  void _deleteTool(ToolModel tool) {
    ref.watch(allToolsProvider.notifier).deleteTool(tool);
  }

  @override
  void initState() {
    /// Fetch tools by userId
    ref.read(allToolsProvider.notifier).getAllByUser(
        userId: ref.read(currentUserProvider)!.id);
    super.initState();
  }

  Future<void> _refresh() async {
    ref.watch(allToolsProvider.notifier)
        .getAllByUser(userId: ref.read(currentUserProvider)!.id);
  }

  @override
  Widget build(BuildContext context) {
    final tools = ref.watch(authUserToolsProvider);

    return Scaffold(
      appBar: UserAppbar("Les meves eines"),
      drawer: UserDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, toolAddFormScreenRoute);
        },
        label: Text('Afegir eina'),
      ),
      body: tools.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
            onRefresh: _refresh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(('Disponibilitat:')),
                        ],
                      ),
                    ),
                    ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tools.length,
                    itemBuilder: (context, index) {
                      final tool = tools[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(tool.title),
                            subtitle: Text(tool.description),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Switch(
                                value: tool.isAvailable,
                                activeTrackColor: Colors.white10,
                                //activeColor: Colors.blue,
                                onChanged: (value) {
                                  ref.read(allToolsProvider.notifier).updateTool(
                                      tool.copyWith(isAvailable: value));
                                },
                              ),
                                CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                    AssetImage(tool.images![0])),
                            ]),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PopupMenuButton(
                                    icon: Icon(Icons.edit),
                                    itemBuilder: (context) =>
                                    [
                                      PopupMenuItem(
                                        value: tool,
                                        child: Text("Editar eina"),
                                      ),
                                    ],
                                    onSelected: (value) {
                                      if (value == tool) {
                                        Navigator.pushNamed(
                                            context, toolEditCardScreenRoute,
                                            arguments: EditToolArguments(
                                                tool.id!));
                                      }
                                    },
                                  ),
                                  PopupMenuButton(
                                    icon: Icon(Icons.delete),
                                    onSelected: _deleteTool,
                                    itemBuilder: (context) =>
                                    [
                                      PopupMenuItem(
                                        value: tool,
                                        child: Text("Esborrar de la llista?"),
                                      ),
                                    ],
                                  ),
                                ]),
                            onTap: () {
                              Navigator.pushNamed(context, toolDetailScreenRoute,
                                  arguments: ToolDetailArguments(tool.id!));
                            },
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ]),
              ),
           // ],
          ),
        //),
     // ),
    );
  }
}
