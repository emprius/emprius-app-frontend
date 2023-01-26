import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/common_widgets/datesrange_calendar.dart';
import 'package:empriusapp/src/core/helper/utils/widget_spacing.dart';
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
    const double padding = 24;

    return tool == null
        ? Container()
        :  Scaffold(
          appBar: UserAppbar("Eina"),
          backgroundColor: Theme.of(context).backgroundColor,
          floatingActionButton: ref.read(userProvider).id != tool.userId
          ? FloatingActionButton.extended(
            onPressed: () async{
              await Navigator.pushNamed(context, toolAskFormScreenRoute, arguments: ToolDetailArguments(widget.args.id));
            },
            label: Text("Demana"),)
          : null,

          body: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding),
                  child: tool.images !=null
                  ? ToolCarousel(tool.images!)
                  : null
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(tool.title, style: (Theme.of(context).textTheme.headline2),),
                        (tool.toolCategory as ToolCategory).label as Widget,
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        RatingStars(rating: 5),
                      ],),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(tool.description)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: padding),
                        child: Row(
                          children: [
                            const Text("Cost per dia:",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            addHorizontalSpace(10),
                            Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.5))
                                ]),
                              child: Text(tool.cost.toString()),
                            ),
                            addHorizontalSpace(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(tool.maybeFree !=null && tool.maybeFree == true)
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(child: Icon(Icons.check)),
                                        TextSpan(text: 'Eina gratuita')
                                      ]
                                    )
                                  ),
                                if(tool.askWithFee !=null && tool.askWithFee == true)
                                  const Text.rich(
                                      TextSpan(
                                          children: [
                                            WidgetSpan(child: Icon(Icons.check)),
                                            TextSpan(text: 'Demanar amb fiansa')
                                          ]
                                      )
                                  ),
                              ],),
                          ],),),
                    Row(
                      children: [
                        const Text("Opcions de transport: ",
                          style: TextStyle(fontWeight: FontWeight.bold
                        ),),
                        addHorizontalSpace(10),
                        Text((tool.transportOptions as TransportOptions).displayName!),
                      ],),

              ],),
          ),],
      ),
    );
  }
}


/*  child: Column(

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

            DatesRangeCalendar(dateRanges: tool.reservedDates),
            SizedBox(height: 40),
          ],
          ),*/