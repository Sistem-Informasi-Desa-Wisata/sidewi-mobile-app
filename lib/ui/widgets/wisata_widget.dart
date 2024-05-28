import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';

class WisataWidgetListHorizontal extends StatelessWidget {
  const WisataWidgetListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: WisataItemsWidget(),
            );
          }),
    );
  }
}

class WisataItemsWidget extends StatelessWidget {
  const WisataItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 180,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
                image: AssetImage('assets/images/foto_dummy.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          width: 180,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              colors: [
                Color(0XFF0000001F)
                    .withOpacity(0.12), // Warna pertama dengan opacity 0.8
                Color(0XFF0000001F)
                    .withOpacity(0.6), // Warna kedua dengan opacity 0.5
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 109, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sangeh",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 15 / 12,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Kabupaten Badung",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 10 / 8,
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class WisataWidgetListVertical extends StatelessWidget {
  const WisataWidgetListVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: WisataItemsWidgetVertical(),
            );
          }),
    );
  }
}

class WisataItemsWidgetVertical extends StatelessWidget {
  const WisataItemsWidgetVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
                image: AssetImage('assets/images/foto_dummy.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              colors: [
                Color(0XFF0000001F)
                    .withOpacity(0.12), // Warna pertama dengan opacity 0.8
                Color(0XFF0000001F)
                    .withOpacity(0.6), // Warna kedua dengan opacity 0.5
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          child: Center(
                            child: GestureDetector(
                                onTap: () {
                                  // Aksi ketika tombol ditekan
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/ic_star.svg')),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 16,
                          child: Center(
                            child: Text(
                              "4.3",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 12 / 10,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      child: Center(
                        child: GestureDetector(
                            onTap: () {
                              // Aksi ketika tombol ditekan
                            },
                            child: SvgPicture.asset(
                                'assets/icons/ic_outline_love.svg')),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 79),
                    child: Text(
                      "Tenganan Pegringsingan",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 15 / 12,
                      ),
                      textAlign: TextAlign.left,
                    )),
                Text(
                  "Kabupaten Karangasem",
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 12 / 10,
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
