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
    //var stars = numStars(widget.rating);

    return RatingBarIndicator(
      rating: widget.rating,
        itemSize: 20,
        itemCount: 5,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Theme.of(context).colorScheme.tertiaryContainer,
      ),
    );

    // RatingBar(
    //   initialRating: widget.rating,
    //   itemSize: 20,
    //   itemCount: 5,
    //   allowHalfRating: true,
    //   ratingWidget: RatingWidget(
    //     empty: const Icon(
    //       Icons.star_outline,
    //       color: Colors.orange,
    //     ),
    //     full: const Icon(Icons.star, color: Colors.orange),
    //     half: const Icon(
    //       Icons.star_half,
    //       color: Colors.orange,
    //     ),
    //   ),
    //   onRatingUpdate:(value) {
    //     setState(() {
    //       //stars = value;
    //       _ratingValue = value;
    //     });
    //   },
    // );


    //return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      //mainAxisSize: MainAxisSize.min,
      //children: [
        //Rating number
        // Text(
        //   rating == 0 ? 'Nou usuari' : rating.toString(),
        //   style: const TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        //const SizedBox(width: 10),

        //Rating stars
        // for (int i = 0; i < stars; i++)
        //   Padding(
        //     padding: i == 0
        //         ? const EdgeInsets.only(right: 1)
        //         : const EdgeInsets.symmetric(horizontal: 1),
        //     child: const Icon(
        //       Icons.star,
        //       size: 19,
        //     ),
        //   ),

        //Empty stars
        // for (int i = stars; i < 5; i++)
        //   Padding(
        //     padding: i == 0
        //         ? const EdgeInsets.only(right: 1)
        //         : const EdgeInsets.symmetric(horizontal: 1),
        //     child: Icon(
        //       Icons.star,
        //       size: 19,
        //       color: Colors.grey[300],
        //     ),
        //   ),],);
  }
}

