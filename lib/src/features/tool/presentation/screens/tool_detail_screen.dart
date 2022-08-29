import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_provider.dart';
import 'package:empriusapp/src/features/tool/presentation/widgets/tool_caroussel.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';


class ToolDetailScreen extends ConsumerStatefulWidget {
  final ToolDetailArguments args;
  const ToolDetailScreen(this.args, {Key? key}) : super(key: key);

  @override
  createState() => _ToolDetailScreenState();
}

class _ToolDetailScreenState extends ConsumerState<ToolDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final tool = ref.watch(singleToolProvider(widget.args.id));

    return Scaffold(
      appBar: UserAppbar("Eina"),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async{
            await Navigator.pushNamed(context, toolAskFormScreenRoute, arguments: ToolDetailArguments(widget.args.id));
          },
          label: Text("Demana"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //TODO extract to list of labels dynamic
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 5.0, 10.0),
                    child: Text(
                      tool!.title,
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
              if(tool.images !=null)ToolCaroussel(tool.images!),
              SizedBox(height: 20.0),
              RatingStars(rating: 5),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                child: Text(
                  tool.description,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cost per dia: ", style: TextStyle(fontWeight: FontWeight.bold
                  ),),
                  Text(tool.cost.toString()),
                ],
              ),
              Column(
                children: [
                  if(tool.maybeFree !=null && tool.maybeFree == true)Text('Eina gratuita'),
                  if(tool.askWithFee !=null && tool.askWithFee == true)Text('Pots demanarla amb fiansa'),
                  Text((tool?.transportOptions as TransportOptions).displayName!)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
