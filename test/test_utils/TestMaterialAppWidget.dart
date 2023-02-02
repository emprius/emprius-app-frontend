import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'TestNavigationObserver.dart';

class TestMaterialAppWidget extends StatelessWidget {
  //final NavigatorObserver navigatorObserver;
  final Widget home;

  TestMaterialAppWidget({
    //Key key,
    required this.home
    //this.navigatorObserver
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        //title: 'Widget Test',
        home: home,
        //navigatorObservers: [navigatorObserver],
        //routes: _testRoutes(),
      ),
    );
  }
}

/*  Map<String, WidgetBuilder> _testRoutes() {
    return <String, WidgetBuilder>{
      Routes.registerScreenRoute: (context) => _testRoute(Routes.registerScreenRoute),
    };
  }
  _testRoute(String routeName) => DummyTestRoute(routeName: routeName, key: Key(routeName),);
}

class DummyTestRoute extends StatelessWidget {
  final String routeName;

  DummyTestRoute({required Key key, required this.routeName}): super(key: Key(routeName));

  @override
  Widget build(BuildContext context) => Text(routeName);

}*/
