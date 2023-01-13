import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/common_widgets/datesrange_calendar.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/presentation/widgets/tool_caroussel.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
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

    final tool = ref.watch(toolByIdProvider(widget.args.id));

    return tool == null ? Container() :  Scaffold(
      appBar: UserAppbar(title: 'Eina',),
      floatingActionButton: ref.read(userProvider).id != tool.userId ?
          FloatingActionButton.extended(
            onPressed: () async{
              await Navigator.pushNamed(context, toolAskFormScreenRoute, arguments: ToolDetailArguments(widget.args.id));
            },
            label: const Text("Demana"),)
          : null,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(height: 20.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                  child: Text(
                    tool.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                (tool.toolCategory as ToolCategory).label as Widget,
              ]),
              if(tool.images !=null)ToolCaroussel(tool.images!),
              const SizedBox(height: 20.0),
              const RatingStars(rating: 5),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                child: Text(
                  tool.description,
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Cost per dia: ", style: TextStyle(fontWeight: FontWeight.bold
                  ),),
                  Text(tool.cost.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Opcions de transport: ", style: const TextStyle(fontWeight: FontWeight.bold
                  ),),
                  Text((tool.transportOptions as TransportOptions).displayName!),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  if(tool.maybeFree !=null && tool.maybeFree == true)const Text('Eina gratuita'),
                  if(tool.askWithFee !=null && tool.askWithFee == true)const Text('Pots demanarla amb fiansa'),
               ],
              ),

              DatesRangeCalendar(dateRanges: tool.reservedDates),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
