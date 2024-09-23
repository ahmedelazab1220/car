import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  final double initialRating;
  final void Function(double) onRatingUpdate;
  final String text;
  final bool ignoreGestures;
  const RatingWidget({
    super.key,
    required this.initialRating,
    required this.onRatingUpdate,
    required this.text,
    this.ignoreGestures = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: AppStyles.textStyle16_700,
          ),
          const Spacer(),
          RatingBar.builder(
            itemSize: 30,
            initialRating: initialRating,
            ignoreGestures: ignoreGestures,
            minRating: 1,
            direction: Axis.horizontal,
            // allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 1),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: onRatingUpdate,
          ),
        ],
      ),
    );
  }
}

class Rate extends StatelessWidget {
  final double initialRating;
  const Rate({
    super.key,
    required this.initialRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RatingBar.builder(
        itemSize: 30,
        initialRating: initialRating,
        ignoreGestures: true,
        minRating: 1,
        direction: Axis.horizontal,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (_) {},
      ),
    );
  }
}
