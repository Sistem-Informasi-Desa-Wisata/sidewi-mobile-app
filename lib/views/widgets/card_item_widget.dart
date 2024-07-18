import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                left: 12,
                bottom: 12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: SizedBox()),
                          Text(
                            "25 Januari 2024",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 16.400001525878906 / 10,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Festival Budaya Sangeh",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 20.5 / 12,
                            ),
                            textAlign: TextAlign.left,
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
                  SizedBox(
                    width: 32,
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
