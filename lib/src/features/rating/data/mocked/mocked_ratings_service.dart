import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/rating/domain/rating_type_enum.dart';
import 'package:flutter/material.dart';

var sampleReservations =  [
DateTimeRange(start: DateTime(2022, 08, 28), end: DateTime(2022, 09, 15)),
DateTimeRange(start: DateTime.now().add(const Duration(days: 1)), end: DateTime.now().add(const Duration(days: 3))),
DateTimeRange(start: DateTime.now().add(const Duration(days: 10)), end: DateTime.now().add(const Duration(days: 23))),
];

var sampleRatings = [
  RatingModel(
    ratingId: 1,
    isPending: true,
    fromUserId: 1,
    toUserId: 2,
    //title
    //thumbnail
    rating: 0,
    bookingId: 1,
    ratingType: RatingType.ALL,
    bookingReservedDates: sampleReservations,
  ),
  RatingModel(
    ratingId: 2,
    isPending: true,
    fromUserId: 1,
    toUserId: 2,
    //title
    //thumbnail
    rating: 0,
    bookingId: 1,
    ratingType: RatingType.ALL,
    bookingReservedDates: sampleReservations,
  ),
  RatingModel(
    ratingId: 3,
    isPending: true,
    fromUserId: 1,
    toUserId: 2,
    //title
    //thumbnail
    rating: 0,
    bookingId: 1,
    ratingType: RatingType.ALL,
    bookingReservedDates: sampleReservations,
  )
];