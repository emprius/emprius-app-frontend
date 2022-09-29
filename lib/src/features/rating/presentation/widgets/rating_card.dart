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

class RatingCard extends StatelessWidget {
  final RatingModel ratingModel;

  RatingCard(this.ratingModel, {Key? key}) : super(key: key);

  var newRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(ratingModel.thumbnail!),
            ),
            title: Row(
              children: [
                Text("Valoracio: "),
                Text(
                  "${ratingModel.title!}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ],
            ),
            subtitle: Consumer(builder: (context, ref, _) {
              var booking =
                  ref.read(bookingByIdProvider(ratingModel.bookingId!));
              return Container(
                padding: EdgeInsets.all(6.0),
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0))),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(Icons.calendar_month_outlined),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                        "${getFormattedDate(booking.reservedDates!.start)} : ${getFormattedDate(booking.reservedDates!.end)} "),
                  ),
                ]),
              );
            }),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (ratingModel.isPending == false)
                  Icon(Icons.check_box_outlined, color: Colors.purple),
              ],
            ),
            onTap: () async {
              await Navigator.pushNamed(context, bookingDetailScreenRoute,
                  arguments: BookingDetailArguments(ratingModel.bookingId!));
            },
          ),
          if (ratingModel.isPending!)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0.0, 10, 0),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
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
                    //var ratings = ref.watch(allRatingsProvider);
                    return CustomTextButton(
                      // ref
                      //     .read(allRatingsProvider.notifier)
                      //     .doRating(ratingModel.copyWith(isPending: false));
                      // Navigator.pop(context)},;
                      text: 'GUARDA',
                      onClicked: () {
                        ref
                            .read(allRatingsProvider.notifier)
                            .doRating(ratingModel, newRating);
                      },
                    );
                  }),
                ]))
          else
            RatingBarIndicator(
              rating: ratingModel.rating!,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.purple,
              ),
              itemSize: 25,
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
