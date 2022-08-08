import 'package:empriusapp/routes/routes.dart';
import 'package:empriusapp/views/screens/tool_card_screen.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/tool_model.dart';
import '../../providers/tool_provider.dart';

class UserToolList extends ConsumerStatefulWidget {
  const UserToolList({
    Key? key,
  }) : super(key: key);

  @override
  createState() => _UserToolListState();
}

class _UserToolListState extends ConsumerState<UserToolList> {
  @override
  Widget build(BuildContext context) {
    final tools = ref.watch(toolListProvider);

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
              leading: Switch(value: tool.isAvailable, onChanged: (value) {  },),
              trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.edit),
                    Icon(Icons.delete)
                  ]),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> ToolCardScreen(
                        tool: ToolModel(
                          id: tool.id,
                          title: tool.title,
                          description: tool.description, maybeFree: tool.maybeFree, cost: tool.cost, needsTransport: tool.needsTransport,
                        )
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
