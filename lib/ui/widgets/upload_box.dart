import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';

class UploadBox extends StatelessWidget {
  const UploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            'assets/images/dashBox.png',
            filterQuality: FilterQuality.none,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.mainGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 120,
              height: 120,
              child: IconButton(
                iconSize: 24,
                padding: EdgeInsets.zero,
                onPressed: null,
                icon: Image.asset(
                  'assets/images/foto.png',
                  filterQuality: FilterQuality.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
