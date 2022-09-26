import 'dart:io';

import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/data/repositories/ratings_repository.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final ratings = ref.watch(allRatingsProvider);

    return Scaffold(
      appBar: UserAppbar("Rating"),
      body:
      ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
          itemCount: ratings.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder:  (context, index) {
            final rating = ratings[index];
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        backgroundImage: FileImage(File(rating.thumbnail!))),
                    title: Text("Valorar ${rating.title!}"),
                    subtitle: ElevatedButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.remove_red_eye),
                      label: Text("Veure detall"),
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RatingStars(rating: rating.rating!,),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: (){},
                            icon: Icon(Icons.star),
                            label: Text("Valorar"),
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
//
//
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
