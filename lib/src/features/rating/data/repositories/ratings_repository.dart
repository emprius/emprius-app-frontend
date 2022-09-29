import 'package:empriusapp/src/features/rating/data/mocked/mocked_ratings_service.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final ratingsRepositoryProvider = Provider<RatingsRepository>((ref) {
  return RatingsRepository();
});

class RatingsRepository{

  ///String get path => "/ratings";
  Future<List<RatingModel>> getAllRatings() async{
    return sampleRatings;
  }

  ///String post path => "/rating/{ratingId}";
  Future<RatingModel> doRate({
    required RatingModel ratingModel,
    required double value,
  }) async {
    var updatedRating = ratingModel.copyWith(rating: value, isPending: false);
    sampleRatings = [...sampleRatings]
      ..[sampleRatings.indexWhere((rating) => rating.ratingId == ratingModel.ratingId)] = updatedRating;
    return updatedRating;
  }


///String get path => "ratings/tool";
///Rate tool booked FROM a user
//   Future<List<RatingModel>> getToolRatings({
//   required int fromUserId,
// }) async{
//     return sampleRatings;
//   }


///String get path => "/ratings/user";
///Rate user TO whom one have rented a tool;
// Future<List<RatingModel>> getUserRatings({
//   required int toUserId,
// }) async{
//   return sampleRatings;
// }

///String get path => "/rating/{ratingId}";
// Future<RatingModel> fetchOne({
//   required int ratingId,
// }) async {
//   return sampleRatings.elementAt(ratingId);
// }


}