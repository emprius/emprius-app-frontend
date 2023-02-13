import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/core/helper/utils/widget_spacing.dart';
import 'package:empriusapp/src/core/config/routes.dart';
import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/rating/domain/rating_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingCard extends StatelessWidget {
  final RatingModel ratingModel;
  RatingCard(this.ratingModel, {Key? key}) : super(key: key);
  var newRating = 0.0;
  final double padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primaryContainer,
        )),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              isThreeLine: true,
              onTap: () async {
                await Navigator.pushNamed(context, bookingDetailScreenRoute,
                    arguments: BookingDetailArguments(ratingModel.bookingId!));
              },
              leading: ratingModel.ratingType == RatingType.USER_RATE
                  ? CircleAvatar(radius: 40,
                  backgroundImage: AssetImage(ratingModel.thumbnail!))
                  : null,
              title: Text(ratingModel.title!,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Consumer(builder: (context, ref, _) {
                var booking = ref.read(bookingByIdProvider(ratingModel.bookingId!));
                return Text("L'intercanvi es va fer del ${getFormattedDate(booking.reservedDates!.start)} al ${getFormattedDate(booking.reservedDates!.end)}",
                  style: Theme.of(context).textTheme.bodyText2,
                );
              }),
              trailing: ratingModel.ratingType == RatingType.TOOL_RATE
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(image: AssetImage(ratingModel.thumbnail!), width: 100.0,),
              )
                  : null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ratingModel.isPending!
                      ? RatingBar.builder(
                        initialRating: newRating,
                        minRating: 1,
                        itemCount: 5,
                        itemSize: 25,
                        allowHalfRating: true,
                        itemBuilder: (context, _) => Icon(
                            Icons.star, color: Theme.of(context).colorScheme.tertiary),
                          updateOnDrag: true,
                          onRatingUpdate: (value) => newRating = value,
                      )
                      : RatingBarIndicator(
                        rating: ratingModel.rating!,
                          itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Theme.of(context).colorScheme.error,
                          ),
                          itemSize: 25,
                      ),
                  addHorizontalSpace(20),
                  ratingModel.isPending!
                      ? Consumer(builder: (context, ref, _) {
                          return CustomTextButton(
                        text: 'VALORAR',
                        onClicked: () {
                        ref
                            .read(allRatingsProvider.notifier)
                            .doRating(ratingModel, newRating);
                          },
                        );
                      })
                      : Icon(Icons.check_box_outlined, color:Theme.of(context).colorScheme.error,size: 25.0,),
                ],),
            ),
          ],),
      ),
    );
  }
}
