import 'dart:io';
import 'package:empriusapp/src/core/common_widgets/custom_text_button.dart';
import 'package:empriusapp/src/core/common_widgets/rating_stars.dart';
import 'package:empriusapp/src/core/routes.dart';
import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/data/repositories/ratings_repository.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:empriusapp/src/features/rating/presentation/widgets/rating_card.dart';

class RatingScreen extends ConsumerStatefulWidget {
  @override
  createState() => _RatingScreenState();
}

class _RatingScreenState extends ConsumerState<RatingScreen> {

  List<RatingModel> ratings = [];
  Future _refresh() async {
    ratings = ref.watch(allRatingsProvider);
  }

  @override
  void initState() {
    ref.read(allRatingsProvider.notifier).getAllRatings();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final ratings = ref.watch(allRatingsProvider);

    return Scaffold(
      appBar: UserAppbar(title: 'Rating',),
      drawer: UserDrawer(),
      body: ratings.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: ratings.length,
          itemBuilder: (context, index) {
            final ratingModel = ratings[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingCard(ratingModel)
            );
          },
        ),
      ),
    );
  }
}