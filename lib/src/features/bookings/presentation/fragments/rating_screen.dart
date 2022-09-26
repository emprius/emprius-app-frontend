import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/data/repositories/ratings_repository.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingScreen extends ConsumerStatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  createState() => _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<RatingScreen> {
  @override
  void initState() {
    ref.read(allRatingsProvider.notifier).getAllRatings();
    super.initState();
  }


double? _newRating;

  @override
  Widget build(BuildContext context) {
    final ratings = ref.watch(allRatingsProvider);
    //late RatingModel rating;

    return Scaffold(
      appBar: UserAppbar("Rating"),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: ratings.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final rating = ratings[index];
          var stars = rating.rating;

          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: FileImage(File(rating.thumbnail!))),
                  title: Text("Valorar ${rating.title!}"),
                  subtitle: ElevatedButton.icon(
                    onPressed: () async {
                      await Navigator.pushNamed(
                          context, bookingDetailScreenRoute,
                          arguments: BookingDetailArguments(rating.bookingId!));
                    },
                    icon: Icon(Icons.remove_red_eye),
                    label: Text("Veure detall"),
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RatingStars(
                        rating: stars!,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.star),
                          label: Text("Valorar"),
                          onPressed: () async {
                            return await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Valorar ${rating.title}"),
                                          //buildRating(),
                                          RatingBar.builder(
                                            initialRating: stars!,
                                            minRating: 1,
                                            itemCount: 5,
                                            allowHalfRating: true,
                                            itemBuilder: (context, _) =>
                                                Icon(
                                                    Icons.star,
                                                    color: Colors.amberAccent),
                                            updateOnDrag: true,
                                            onRatingUpdate: (value) =>
                                                setState(() {
                                                  //TODO PERSIST and show - make not final?
                                                  stars = value;
                                                  //rating = rating!.copyWith(rating: value);
                                                }),
                                          ),
                                        ]),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("OK"),
                                      ),

                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancelar"),
                                      ),

                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Container(
// width: 50,
// height: 100,
// margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(20.0)),
// color: Colors.white,
// boxShadow: [ BoxShadow(
// color: Colors.black.withAlpha(100),
// blurRadius: 10.0)],
// ),
// );
