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