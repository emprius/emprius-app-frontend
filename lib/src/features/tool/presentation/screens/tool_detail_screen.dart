import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/common_widgets/reservations_calendar.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/tool/application/providers/tool_providers.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
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

    final tool = ref.watch(toolByIdProvider(widget.args.id));

    return tool == null ? Container() :  Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 20.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Opcions de transport: ", style: TextStyle(fontWeight: FontWeight.bold
                  ),),
                  Text((tool.transportOptions as TransportOptions).displayName!),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  if(tool.maybeFree !=null && tool.maybeFree == true)Text('Eina gratuita'),
                  if(tool.askWithFee !=null && tool.askWithFee == true)Text('Pots demanarla amb fiansa'),
               ],
              ),

              ReservationsCalendar(dateRanges: tool.reservedDates),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
