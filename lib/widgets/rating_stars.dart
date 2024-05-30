import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int? rating;

  const RatingStars(this.rating, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 0; i < rating!; i++) {
      stars.add(
        const Icon(
          Icons.star,
          color: Colors.orange,
          size: 18.0,
        ),
      );
    }
    return Row(
      children: stars,
    );
  }
}
