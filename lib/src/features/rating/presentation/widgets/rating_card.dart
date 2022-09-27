import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingCard extends StatelessWidget {
  final RatingModel ratingModel;

  RatingCard(this.ratingModel, {Key? key}) : super(key: key);

  var newRating = 0.0;

  @override
  Widget build(BuildContext context) {

    //var newRating = 0;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundImage: FileImage(File(ratingModel.thumbnail!))),
            title: Text("Valorar ${ratingModel.title!}"),
            subtitle: Consumer(builder: (context, ref, _) {
              var booking =
                  ref.read(bookingByIdProvider(ratingModel.bookingId!));
              return Text(
                "Dates d'intercanvi: ${booking.startDate} / ${booking.endDate}",
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              );
            }),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                if(ratingModel.isPending == false)
                 Icon(Icons.check_box_outlined, color: Colors.purple),
              ],
            ),
            onTap: () async {
              await Navigator.pushNamed(context, bookingDetailScreenRoute,
                  arguments: BookingDetailArguments(ratingModel.bookingId!));
            },
          ),
          if(ratingModel.isPending!)
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Valorar:",
                  style: TextStyle(color: Color(0xFF6200EE)),
                ),

                // TextButton(
                //   child: const Text(
                //     "Valorar:",
                //     style: TextStyle(color: Color(0xFF6200EE)),
                //   ),
                //   onPressed: () async {
                //     return await showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           return Consumer(
                //             builder: (context, ref, _) {
                //               return AlertDialog(
                //                 content: Column(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.center,
                //                     mainAxisSize: MainAxisSize.min,
                //                     children: [
                //                       Text("Valorar ${ratingModel.title}"),
                //                       //buildRating(),
                //                       RatingBar.builder(
                //                         initialRating: newRating!,
                //                         itemSize: 20,
                //                         minRating: 1,
                //                         itemCount: 5,
                //                         allowHalfRating: true,
                //                         itemBuilder: (context, _) => const Icon(
                //                             Icons.star,
                //                             color: Colors.amberAccent,
                //                         size: 10,
                //                         ),
                //                         updateOnDrag: true,
                //                         onRatingUpdate: (value) =>
                //                             newRating = value,
                //                       ),
                //                     ]),
                //                 actions: [
                //                   TextButton(
                //                     onPressed: () {
                //                       Navigator.of(context).pop();
                //                     },
                //                     child: Text("Cancelar"),
                //                   ),
                //                   TextButton(
                //                     child: Text("Guarda"),
                //                     onPressed: () {
                //                       ref
                //                           .read(allRatingsProvider.notifier)
                //                           .doRating(ratingModel.copyWith(
                //                               rating: newRating));
                //                       ref
                //                           .read(allRatingsProvider.notifier)
                //                           .doRating(ratingModel.copyWith(
                //                               isPending: false));
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                 ],
                //               );
                //             },
                //           );
                //         });
                //   },
                // ),
                  RatingBar.builder(
                    initialRating: newRating,
                    minRating: 1,
                    itemCount: 5,
                    itemSize: 25,
                    allowHalfRating: true,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amberAccent),
                    updateOnDrag: true,
                    onRatingUpdate: (value) => newRating = value,
                  ),
                  Consumer(builder: (context, ref, _) {
                  var ratings = ref.watch(allRatingsProvider);

                  //TODO CEHCK THIS
                  return TextButton(
                    child: Text("Guarda"),
                    onPressed: () {
                      ref
                          .read(allRatingsProvider.notifier)
                          .doRating(ratingModel, newRating);
                      // ref
                      //     .read(allRatingsProvider.notifier)
                      //     .doRating(ratingModel.copyWith(isPending: false));
                      // Navigator.pop(context);
                    },
                  );
                }),
                //RatingStars(rating: ratingModel.rating!),
              ],
            )
          else
            RatingBarIndicator(
              rating: ratingModel.rating!,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color:Colors.purple,
    ),
              itemSize: 25,
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// TextButton(
//   onPressed: () async {
//     await Navigator.pushNamed(context, bookingDetailScreenRoute,
//         arguments: BookingDetailArguments(ratingModel.bookingId!));
//   },
//   child: Text(
//     "Veure detall",
//     style: TextStyle(color: Color(0xFF6200EE).withOpacity(0.6)),
//   ),
// ),

//
// Row(mainAxisSize: MainAxisSize.min, children: [
// if (ratingModel.isPending == false) const Icon(Icons.check, size: 40),]),

// Padding(
//   padding: const EdgeInsets.fromLTRB(20, 2.0, 10, 5.0),
//   child: Text(
//     'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
//     style: TextStyle(color: Colors.black.withOpacity(0.6)),
//   ),
//),

// TextButton(
//   child: const Text(
//     "Valorar:",
//     style: TextStyle(color: Color(0xFF6200EE)),
//   ),
//   onPressed: () async {
//     return await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Consumer(
//             builder: (context, ref, _) {
//               return AlertDialog(
//                 content: Column(
//                     crossAxisAlignment:
//                         CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text("Valorar ${ratingModel.title}"),
//                       //buildRating(),
//                       RatingBar.builder(
//                         initialRating: newRating!,
//                         minRating: 1,
//                         itemCount: 5,
//                         allowHalfRating: true,
//                         itemBuilder: (context, _) => const Icon(
//                             Icons.star,
//                             color: Colors.amberAccent),
//                         updateOnDrag: true,
//                         onRatingUpdate: (value) =>
//                             newRating = value,
//                       ),
//                     ]),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text("Cancelar"),
//                   ),
//                   TextButton(
//                     child: Text("Guarda"),
//                     onPressed: () {
//                       ref
//                           .read(allRatingsProvider.notifier)
//                           .doRating(ratingModel.copyWith(
//                               rating: newRating));
//                       ref
//                           .read(allRatingsProvider.notifier)
//                           .doRating(ratingModel.copyWith(
//                               isPending: false));
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         });
//   },
// ),
