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
