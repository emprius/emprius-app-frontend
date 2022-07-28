import 'package:empriusapp/views/widgets/common/custom_text_button.dart';
import 'package:empriusapp/views/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/tool_model.dart';

class ToolCardScreen extends ConsumerStatefulWidget {
  final ToolModel? tool;
  const ToolCardScreen({Key? key, this.tool}) : super(key: key);

  @override
  createState() => _ToolCardScreenState();
}

class _ToolCardScreenState extends ConsumerState<ToolCardScreen> {

  @override
  Widget build(BuildContext context) {

    //final tools = ref.watch(toolListProvider);

    return Container(
      child: Scaffold(
        appBar: UserAppbar("Eina"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(widget.tool!.title,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Image(image: AssetImage("assets/images/bike.png"), width: 200, height: 200,),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 2.0, 30.0, 2.0),
                child: Text(widget.tool!.description,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton.icon(
                icon: const Icon(Icons.star),
                onPressed: (){}, label: Text('Rating'),),
              CustomTextButton(onClicked: () {  }, text: 'Demana',),
            ],
          ),
        ),
      ),
    );
  }
}
