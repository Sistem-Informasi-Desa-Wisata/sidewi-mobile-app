import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItemWisataWidget extends StatefulWidget {
  const CardItemWisataWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<CardItemWisataWidget> createState() => _CardItemWisataWidgetState();
}

class _CardItemWisataWidgetState extends State<CardItemWisataWidget> {
  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage('assets/images/foto_berita.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Color(0XFF00000000)
                      .withOpacity(0), // Warna pertama dengan opacity 0.8
                  Color(0XFF00000000)
                      .withOpacity(0.7), // Warna kedua dengan opacity 0.5
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, bottom: 12, right: 8, top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 16,
                                          height: 16,
                                          child: SvgPicture.asset(
                                              'assets/icons/ic_star.svg')),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        child: Text(
                                          "4.3",
                                          style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 32,
                                  height: 32,
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isFavorite = !_isFavorite;
                                        });
                                      },
                                      child: _isFavorite == true
                                          ? SvgPicture.asset(
                                              'assets/icons/ic_favorite_active.svg')
                                          : SvgPicture.asset(
                                              'assets/icons/ic_favorite_nonactive.svg')),
                                )
                              ],
                            ),
                          )),
                          Text(
                            "Tarian Tradisional",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              // height: 20.5 / 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Kesenian dan Budaya",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 16.400001525878906 / 10,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Text(
                              "Festival Budaya Sangeh merupakan sebuah acara tahunan yang diadakan di Desa Sangeh, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan...",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 32,
                  // )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
