import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/fixLogo.png',
              width: 145.5,
              height: 48,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 9.5,
              ),
              Text(
                "Lokasi anda",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff424648),
                  height: 12 / 10,
                ),
                textAlign: TextAlign.right,
              ),
              Text(
                "Kuta Selatan",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff424648),
                  height: 15 / 12,
                ),
                textAlign: TextAlign.right,
              )
            ],
          )
        ],
      ),
    );
  }
}
