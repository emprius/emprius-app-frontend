import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'TestMaterialAppWidget.dart';

void main() {

  Widget _wrapWithMaterialApp(CustomTextButton customTextButton) {
    return TestMaterialAppWidget(
      home: customTextButton,
    );
  }

  testWidgets('Custom text button shows', (tester) async {
    final widget = CustomTextButton(text: 'Text', onClicked: (){});

    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    expect(find.byType(CustomTextButton), findsOneWidget);
  });

  testWidgets("Should see text 'Text'", (WidgetTester tester) async {
    final widget = CustomTextButton(text: 'Text', onClicked: (){});

    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    expect(find.text('Text'), findsOneWidget);
  });

}