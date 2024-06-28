import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Review",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                  height: 20 / 16,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "234 Komentar",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                  height: 15 / 12,
                ),
                textAlign: TextAlign.right,
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 6),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ReviewItemWidget();
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Container(
              width: 300,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xFFF4F4F4), // Warna F4F4F4
                borderRadius: BorderRadius.circular(200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lihat lainnya",
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset('assets/icons/ic_more.svg'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 80,
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/user3.png'),
                      fit: BoxFit.cover, // Mengisi seluruh area container
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Visca",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                              height: 20 / 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "20 Feb 2024",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9fa5a9),
                              height: 12 / 10,
                            ),
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 268,
                      child: Text(
                        "Taman Mumbul merupakan tempat suci bagi umat Hindu di Bali, dan sering digunakan untuk upacara Melasti",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
