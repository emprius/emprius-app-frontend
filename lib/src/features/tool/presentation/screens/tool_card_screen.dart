import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/domain/tool_model.dart';
import 'package:empriusapp/src/features/tool/presentation/widgets/tool_caroussel.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ToolCardScreen extends ConsumerStatefulWidget {
  final ToolModel? tool;
  const ToolCardScreen({Key? key, this.tool}) : super(key: key);

  @override
  createState() => _ToolCardScreenState();
}

class _ToolCardScreenState extends ConsumerState<ToolCardScreen> {
  // List<String> needsTransport = ["Necessita transport", "No es necessari"];
  // List<bool> isChecked = [];
  //
  // @override
  // void initState() {
  //   isChecked = List<bool>.filled(needsTransport.length, false);
  // }

  @override
  Widget build(BuildContext context) {
    //final tools = ref.watch(toolListProvider);

    return Scaffold(
      appBar: UserAppbar("Eina"),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async{
            await Navigator.pushNamed(context, toolAskFormScreenRoute, arguments: ToolDetailArguments(widget.tool!));
          },
          label: Text("Demana"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //todo: extract to list of labels dynamic
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 10.0),
                    child: Text(
                      widget.tool!.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Row(
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
                    ))
              ]),
              ToolCaroussel(),
              SizedBox(height: 10.0),
              RatingStars(rating: 5),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                child: Text(
                  widget.tool!.description,
                  textAlign: TextAlign.center,
                ),
              ),
              //todo checkbox for if needs transport
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
    );
  }
}
