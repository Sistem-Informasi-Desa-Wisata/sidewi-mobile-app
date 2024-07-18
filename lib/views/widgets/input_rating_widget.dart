import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRatingInput extends StatefulWidget {
  final int starCount;
  final double size;
  final String filledStar;
  final String unfilledStar;
  final Function(int) onRatingChanged;
  final double spacing;

  StarRatingInput({
    this.starCount = 5,
    this.size = 48,
    this.filledStar = 'assets/icons/ic_star.svg',
    this.unfilledStar = 'assets/icons/ic_star_border.svg',
    required this.onRatingChanged,
    this.spacing = 18, // Default spacing between stars
  });

  @override
  _StarRatingInputState createState() => _StarRatingInputState();
}

class _StarRatingInputState extends State<StarRatingInput> {
  int _currentRating = 0;

  void _handleRating(int rating) {
    setState(() {
      _currentRating = rating;
    });
    widget.onRatingChanged(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () => _handleRating(index + 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
            child: SvgPicture.asset(
              index < _currentRating ? widget.filledStar : widget.unfilledStar,
              width: widget.size,
              height: widget.size,
            ),
          ),
        );
      }),
    );
  }
}
