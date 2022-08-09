import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  int numStars(int rating) {
    const currentRange = 10 - 1; //max - min of current range
    const targetRange = 5 - 0; //max - min of target range
    final currentRatio = (rating - 1) / currentRange;
    return (currentRatio * targetRange + 0).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final stars = numStars(rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        for (int i = 0; i < stars; i++)
          Padding(
            padding: i == 0
                ? const EdgeInsets.only(right: 1)
                : const EdgeInsets.symmetric(horizontal: 1),
            child: const Icon(
              Icons.star,
              size: 19,
            ),
          ),

        //Empty stars
        for (int i = stars; i < 5; i++)
          Padding(
            padding: i == 0
                ? const EdgeInsets.only(right: 1)
                : const EdgeInsets.symmetric(horizontal: 1),
            child: Icon(
              Icons.star,
              size: 19,
              color: Colors.grey[300],
            ),
          ),
      ],
    );
  }
}