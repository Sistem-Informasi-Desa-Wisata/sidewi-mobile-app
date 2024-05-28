import 'package:flutter/material.dart';

class TextCopyRight extends StatelessWidget {
  const TextCopyRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Copyright © Sidewi 2024",
      style: const TextStyle(
        fontFamily: "Montserrat",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xff262626),
        height: 15 / 12,
      ),
    );
  }
}
