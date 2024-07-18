import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final int starCount;
  final double size;
  final String filledStar;
  final String unfilledStar;

  StarRating({
    this.rating = 0,
    this.starCount = 5,
    this.size = 24.0,
    this.filledStar = 'assets/icons/ic_star.svg',
    this.unfilledStar = 'assets/icons/ic_star_border.svg',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        return SvgPicture.asset(
          index < rating ? filledStar : unfilledStar,
          width: size,
          height: size,
        );
      }),
    );
  }
}
