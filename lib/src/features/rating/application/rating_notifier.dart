import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';
import 'package:empriusapp/src/features/rating/data/mocked/mocked_ratings_service.dart';
import 'package:empriusapp/src/features/rating/data/repositories/ratings_repository.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllRatingsNotifier extends StateNotifier<List<RatingModel>> {
  final RatingsRepository ratingsRepository;

  AllRatingsNotifier({required this.ratingsRepository}) : super([]);

  Future<void> getAllRatings() async{
    state = await ratingsRepository.getAllRatings();
}

  Future<void> doRating(RatingModel ratingModel, double value) async {
    var newRating = await ratingsRepository.doRate(
        ratingModel: ratingModel,
        value: value);
    state = [...state]
      ..[state.indexWhere((rating) => rating.ratingId == newRating.ratingId)] =
          newRating;
  }

  // Future<void> getRatingById({
  //   required int ratingId,
  // }) async {
  //   await ratingsRepository.fetchOne(ratingId: ratingId);
  // }
  //
  // Future<void> getToolRatings({
  //   required int fromUserId,
  // }) async {
  //   var toolsToRate =
  //       await ratingsRepository.getToolRatings(fromUserId: fromUserId);
  //   state = {...state, ...toolsToRate}.toList();
  // }
  //
  // Future<void> getUserRatings({
  //   required int toUserId,
  // }) async {
  //   var usersToRate =
  //       await ratingsRepository.getUserRatings(toUserId: toUserId);
  //   state = {...state, ...usersToRate}.toList();
  // }
}
