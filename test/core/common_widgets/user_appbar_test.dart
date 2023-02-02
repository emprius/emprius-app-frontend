/*
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('User appbar has a title', (tester) async {

    Widget buildTestableWidget(Widget widget){
      return MediaQuery(
          data: const MediaQueryData(),
          child: MaterialApp(home: widget)
      );
    }

    UserAppbar userAppbar = UserAppbar(title: 'title');

    await tester.pumpWidget(buildTestableWidget(userAppbar));

    Finder titleFinder = find.text('title');

    expect(titleFinder, findsOneWidget);

  });
}*/
