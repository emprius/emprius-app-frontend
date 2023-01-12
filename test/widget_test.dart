// import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
// import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
// import 'package:empriusapp/src/features/rating/presentation/widgets/rating_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//
//   setUp(() => null)
//
//   testWidgets('given when then',
//           (WidgetTester tester) async {
//     var ratingModel = RatingModel();
//     await tester.pumpWidget(
//         ProviderScope(
//             child: RatingCard(ratingModel),
//             ));
//     final button = find.text('VALORAR');
//
//     await tester.tap(button);
//     await tester.pump();
//     final checkedIcon = find.byIcon(Icons.check_box_outline_blank_outlined);
//     expect(checkedIcon, findsOneWidget);
//   });
// }
