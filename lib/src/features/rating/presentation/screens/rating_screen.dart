import 'package:empriusapp/src/features/rating/application/rating_provider.dart';
import 'package:empriusapp/src/features/rating/domain/rating_model.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_drawer.dart';
import 'package:flutter/material.dart';
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
    final Size size = MediaQuery.of(context).size;
    const double padding = 8;

    return Scaffold(
      appBar: UserAppbar("Rating"),
      drawer: const UserDrawer(),
      body: ratings.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : RefreshIndicator(
        onRefresh: _refresh,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: ratings.length,
            itemBuilder: (context, index) {
              final ratingModel = ratings[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                child: RatingCard(ratingModel)
              );
            },
          ),
        ),
      ),
    );
  }
}