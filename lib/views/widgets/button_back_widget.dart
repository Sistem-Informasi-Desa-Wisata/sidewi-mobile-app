import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.mainGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 32,
      height: 32,
      child: IconButton(
          iconSize: 24,
          padding: EdgeInsets.zero,
          onPressed: null,
          icon: SvgPicture.asset(
            'assets/icons/ic_back.svg',
            width: 7.1,
            height: 15.84,
          )),
    );
  }
}
