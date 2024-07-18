import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';
import '../screens/searching_screen.dart';

class SearchWidgetStatis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchingScreen()));
        ;
      },
      child: Row(
        children: [
          Expanded(
            // untuk search
            child: Container(
              // width: 268,
              height: 35,
              decoration: BoxDecoration(
                color: MyColors.mainGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Telusuri ....",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9fa5a9),
                          height: 12 / 12,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        child: SvgPicture.asset(
                          'assets/icons/ic_search.svg',
                          height: 20,
                          width: 20,
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
