import 'package:empriusapp/src/core/helper/constants/widget_spacing.dart';
import 'package:empriusapp/src/features/activity/presentation/widgets/user_activity_barchart.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStoryScreen extends ConsumerStatefulWidget {
  const UserStoryScreen({Key? key}) : super(key: key);

  @override
  createState() => _UserStoryState();
}

class _UserStoryState extends ConsumerState<UserStoryScreen> {

  @override
  Widget build(BuildContext context) {
    const double padding = 20;

    return Scaffold(
      appBar: UserAppbar("Historial d'us"),
        drawer: UserDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, top: 16.0, bottom: 16.0),
                      child: ActivityBarchart())
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: padding, horizontal: padding),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Total eines emprestades:",
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
                        child: Text('23'),
                      ),
                  ]),
                  addVerticalSpace(6),
                  Row(
                      children: [
                        const Text("Total eines demanades:",
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
                                BoxShadow(color: const Color(0xFF3D6657).withOpacity(0.5))
                              ]),
                          child: Text('34'),
                        ),
                      ]),
              ]),
            ),
        ]),
      )
    );
  }
}