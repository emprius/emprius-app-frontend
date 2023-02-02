import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/features/bookings/application/notifiers/all_bookings_notifier.dart';
import 'package:empriusapp/src/features/bookings/domain/booking_model.dart';
import 'package:empriusapp/src/features/rating/application/rating_notifier.dart';
import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/data/mocked/mocked_ratings_service.dart';
import 'package:empriusapp/src/features/rating/data/repositories/ratings_repository.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/rating/presentation/widgets/rating_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

//final ratingProvider = StateProvider((ref)=>Icon(Icons.check_box_outlined));
var ratingModel = sampleRatings[0];
var ratingsRepository = RatingsRepository();
const checkedIcon = Icons.check_box_outline_blank_outlined;

void main() {

  Widget buildTestableWidget(StateNotifierProvider<AllRatingsNotifier, List<RatingModel>> mockRatingsProvider) {
    return ProviderScope(
      overrides: [
        allRatingsProvider.overrideWithProvider(mockRatingsProvider),
      ],
      child: MaterialApp(
        home: RatingCard(ratingModel),
      ),
    );
  }
  
  testWidgets('hide button and show check icon when rating the card',
          (WidgetTester tester) async {
    
    final mockRatingsProvider = StateNotifierProvider<AllRatingsNotifier, List<RatingModel>>((ref) => AllRatingsNotifier(ratingsRepository: ratingsRepository));

    await tester.pumpWidget(buildTestableWidget(mockRatingsProvider));

    expect(find.byKey(Key('valorar')), findsOneWidget);
    expect(find.byIcon(checkedIcon), findsNothing);

    await tester.ensureVisible(find.byKey(Key('valorar')));
    await tester.tap(find.byKey(Key('valorar')));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('valorar')), findsNothing);
    expect(find.byIcon(checkedIcon), findsOneWidget);
  });
}



