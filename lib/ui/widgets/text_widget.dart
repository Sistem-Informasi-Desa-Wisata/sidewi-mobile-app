import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/colors.dart';

class TextHeaderWidget extends StatelessWidget {
  const TextHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          ),
          Text(
            "Login to continue using the app",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: MyColors.textGrey),
          )
        ],
      ),
    );
  }
}

class TextSecondary extends StatelessWidget {
  const TextSecondary({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: "Roboto",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: MyColors.SecondaryColor,
        height: 12 / 10,
      ),
    );
  }
}
