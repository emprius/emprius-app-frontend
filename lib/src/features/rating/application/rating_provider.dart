import 'package:empriusapp/src/features/rating/application/rating_notifier.dart';
import 'package:empriusapp/src/features/rating/data/mocked/mocked_ratings_service.dart';
import 'package:empriusapp/src/features/rating/data/repositories/ratings_repository.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/rating/domain/rating_type_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';


final allRatingsProvider = StateNotifierProvider<AllRatingsNotifier, List<RatingModel>>((ref) {
  final _ratingsRepository = ref.watch(ratingsRepositoryProvider);
  return AllRatingsNotifier(ratingsRepository: _ratingsRepository);
});

// Future<List<RatingModel>> getAllRatingsByUser({
//   required int userId,
// }) async{
//   return sampleRatings;
// }


//final ratingsTypeProvider = StateProvider<RatingType>((ref) => RatingType.ALL);

// final filteredRatingProvider = Provider<List<RatingModel>>((ref){
//   final ratingType = ref.watch(ratingsTypeProvider);
//   final ratings = ref.watch(allRatingsProvider);
//
//   switch(ratingType){
//     case RatingType.ALL:
//       return ratings;
//     case RatingType.TOOL_RATE:
//       return ratings.where((element) => false);
//     case RatingType.USER_RATE:
//      return ratings.where((element) => false);
//   }
// });

// final toolRatingProvider = StateProvider<List<RatingModel>>((ref) {
//   //TODO
// });
//
// final userRatingProvider = StateProvider<List<RatingModel>>((ref) {
//  //TODO
// });