import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/rating/domain/rating_type_enum.dart';
import 'package:flutter/material.dart';

var sampleReservations =  [
DateTimeRange(start: DateTime(2022, 08, 28), end: DateTime(2022, 09, 15)),
DateTimeRange(start: DateTime.now().add(const Duration(days: 1)), end: DateTime.now().add(const Duration(days: 3))),
DateTimeRange(start: DateTime.now().add(const Duration(days: 10)), end: DateTime.now().add(const Duration(days: 23))),
];

var sampleThumbnails = [
  '/data/user/0/com.example.empriusapp/cache/image_picker4192891788779617458.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker2314740962926778978.png',
  '/data/user/0/com.example.empriusapp/cache/image_picker2519909079312788563.jpg',
  '/data/user/0/com.example.empriusapp/cache/image_picker5181464323563610078.jpg'
];

var sampleRatings = [
  RatingModel(
    ratingId: 1,
    isPending: true,
    fromUserId: 1,
    toUserId: 2,
    title: "User1",
    thumbnail: sampleThumbnails[0],
    rating: 0,
    bookingId: 1, //bici de passeig
    ratingType: RatingType.USER_RATE,
    bookingReservedDates: sampleReservations,
  ),
  RatingModel(
    ratingId: 2,
    isPending: true,
    fromUserId: 1,
    toUserId: 2,
    title: "User1.1",
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
    title: "Tractor",
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
    title: "Reg automatic",
    thumbnail: sampleThumbnails[3],
    rating: 10,
    bookingId: 3, //Reg automatic,
    ratingType: RatingType.TOOL_RATE,
    bookingReservedDates: sampleReservations,
  ),
];