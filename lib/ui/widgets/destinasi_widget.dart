import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/ui/screens/detail_screen.dart';

class DestinasiWidgetListHorizontal extends StatelessWidget {
  const DestinasiWidgetListHorizontal({super.key});

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
              child: DestinasiItemsWidget(),
            );
          }),
    );
  }
}

class DestinasiItemsWidget extends StatefulWidget {
  const DestinasiItemsWidget({super.key});

  @override
  State<DestinasiItemsWidget> createState() => _DestinasiItemsWidgetState();
}

class _DestinasiItemsWidgetState extends State<DestinasiItemsWidget> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      },
      child: Stack(
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
              padding:
                  const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          width: 16,
                          height: 16,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              child: _isFavorite == false
                                  ? SvgPicture.asset(
                                      'assets/icons/ic_outline_love.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/ic_full_love.svg')),
                        ),
                      ),
                    ],
                  ),
                  Column(
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DestinasiWidgetListVertical extends StatelessWidget {
  const DestinasiWidgetListVertical({super.key});

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
              child: DestinasiItemsWidgetVertical(),
            );
          }),
    );
  }
}

class DestinasiItemsWidgetVertical extends StatelessWidget {
  const DestinasiItemsWidgetVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      },
      child: Stack(
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
      ),
    );
  }
}
