import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              isThreeLine: true,
              onTap: () async {
                await Navigator.pushNamed(context, bookingDetailScreenRoute,
                    arguments: BookingDetailArguments(ratingModel.bookingId!));
              },
              leading: ratingModel.ratingType == RatingType.USER_RATE
                  ? CircleAvatar(radius: 50,
                  backgroundImage: AssetImage(ratingModel.thumbnail!)
              ) : null,
              title: Text(
                ratingModel.title!,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              subtitle: Consumer(builder: (context, ref, _) {
                var booking =
                    ref.read(bookingByIdProvider(ratingModel.bookingId!));
                return Text(
                    "L'intercanvi es va fer del ${getFormattedDate(booking.reservedDates!.start)} al ${getFormattedDate(booking.reservedDates!.end)} ");
              }),
              trailing: ratingModel.ratingType == RatingType.TOOL_RATE
                  ? Image(image: AssetImage(ratingModel.thumbnail!), width: 100.0,)
                : null,
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16.0,
                5.0,
                16.0,
                16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ratingModel.isPending!
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
                  ratingModel.isPending!
                      ? Consumer(builder: (context, ref, _) {
                          //var ratings = ref.watch(allRatingsProvider);
                          return CustomTextButton(
                            key: Key('valorar'),
                            text: 'VALORAR',
                            onClicked: () {
                              ref
                                  .read(allRatingsProvider.notifier)
                                  .doRating(ratingModel, newRating);
                            },
                          );
                        })
                      : const Icon(Icons.check_box_outlined, color: Colors.purple,size: 30.0,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
