import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/rating_type_enum.dart';

class RatingCard extends StatelessWidget {
  final RatingModel ratingModel;

  RatingCard(this.ratingModel, {Key? key}) : super(key: key);

  var newRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: ratingModel.ratingType == RatingType.USER_RATE
                ? Text("Valoració d'usuari")
                : Text("Valoració d'eina"),
            subtitle: Text(
              "${ratingModel.title!}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (ratingModel.isPending == false)
                  Icon(Icons.check_box_outlined, color: Colors.purple),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Consumer(builder: (context, ref, _) {
              var booking =
                  ref.read(bookingByIdProvider(ratingModel.bookingId!));
              return Flexible(
                child: Text(
                    "${getFormattedDate(booking.reservedDates!.start)} : ${getFormattedDate(booking.reservedDates!.end)} "),
              );
            }),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: ratingModel.isPending!
                ? RatingBar.builder(
                          initialRating: newRating,
                          minRating: 1,
                          itemCount: 5,
                          itemSize: 25,
                          allowHalfRating: true,
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amberAccent),
                          updateOnDrag: true,
                          onRatingUpdate: (value) => newRating = value,
                        )
                : RatingBarIndicator(
                    rating: ratingModel.rating!,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                    itemSize: 25,
                  ),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('Més informació'),
                onPressed: () async {
                  await Navigator.pushNamed(context, bookingDetailScreenRoute,
                      arguments: BookingDetailArguments(ratingModel.bookingId!));
                },
              ),
              if(ratingModel.isPending!)
              Consumer(builder: (context, ref, _) {
                //var ratings = ref.watch(allRatingsProvider);
                return CustomTextButton(
                  // ref
                  //     .read(allRatingsProvider.notifier)
                  //     .doRating(ratingModel.copyWith(isPending: false));
                  // Navigator.pop(context)},;
                  text: 'VALORAR',
                  onClicked: () {
                    ref
                        .read(allRatingsProvider.notifier)
                        .doRating(ratingModel, newRating);
                  },
                );
              }),
            ],
          )
        ],),
    );
  }
}
