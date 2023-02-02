import 'package:empriusapp/src/core/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatefulWidget {
  final double rating;

  const RatingStars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  double numStars(double rating) {
    const currentRange = 10 - 1.0; //max - min of current range
    const targetRange = 5.0 - 0.0; //max - min of target range
    final currentRatio = (rating - 1) / currentRange;
    return (currentRatio * targetRange + 0).toDouble();
  }

  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: widget.rating,
        itemSize: 20,
        itemCount: 5,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Theme.of(context).colorScheme.tertiaryContainer,
      ),
    );
  }
}

