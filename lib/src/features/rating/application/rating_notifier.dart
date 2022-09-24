import 'package:empriusapp/src/features/bookings/data/repositories/bookings_repository.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllRatingsNotifier extends StateNotifier<List<RatingModel>>{
  final BookingsRepository ratingsRepository;

  AllRatingsNotifier({
    required this.ratingsRepository}): super([]);

  Future<void> createRating(RatingModel rating) async{
    //
  }

}