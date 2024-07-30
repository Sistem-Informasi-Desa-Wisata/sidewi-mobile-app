import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 232,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "dd mmm yy",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                          height: 16 / 10,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "00.00",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                          height: 16 / 10,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9fa5a9),
                      height: 15 / 10,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
