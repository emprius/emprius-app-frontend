import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/rating/domain/rating_type_enum.dart';
import 'package:flutter/material.dart';

var sampleReservations =  [
DateTimeRange(start: DateTime(2022, 08, 28), end: DateTime(2022, 09, 15)),
DateTimeRange(start: DateTime.now().add(const Duration(days: 1)), end: DateTime.now().add(const Duration(days: 3))),
DateTimeRange(start: DateTime.now().add(const Duration(days: 10)), end: DateTime.now().add(const Duration(days: 23))),
];

var sampleThumbnails = [
  'assets/avatars/avatar2.png',
  'assets/avatars/avatar1.png',
  'assets/tools/tool2.jpg',
  'assets/tools/tool3.jpg',
];

var sampleRatings = [
  RatingModel(
    ratingId: 1,
    isPending: true,
    fromUserId: 1,
    toUserId: 2,
    title: "Pepito",
    thumbnail: sampleThumbnails[0],
    rating: 0,
    bookingId: 4, //bici de passeig
    ratingType: RatingType.USER_RATE,
    bookingReservedDates: sampleReservations,
  ),
  RatingModel(
    ratingId: 2,
    isPending: true,
    fromUserId: 1,
    toUserId: 2,
    title: "Kili",
    thumbnail: sampleThumbnails[1],
    rating: 0,
    bookingId: 2, //burra autonoma
    ratingType: RatingType.USER_RATE,
    bookingReservedDates: sampleReservations,
  ),
  RatingModel(
    ratingId: 3,
    isPending: true,
    fromUserId: 2,
    toUserId: 1,
    title: "Formons fusteria",
    thumbnail: sampleThumbnails[2],
    rating: 15,
    bookingId: 5, //Tractor,
    ratingType: RatingType.TOOL_RATE,
    bookingReservedDates: sampleReservations,
  ),
  RatingModel(
    ratingId: 4,
    isPending: true,
    fromUserId: 2,
    toUserId: 1,
    title: "Carretilla",
    thumbnail: sampleThumbnails[3],
    rating: 10,
    bookingId: 3, //Reg automatic,
    ratingType: RatingType.TOOL_RATE,
    bookingReservedDates: sampleReservations,
  ),
];