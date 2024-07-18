import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/50x50"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 232,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Desa Jatiluwih memposting berita baru",
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                      height: 16 / 10,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    maxLines: 2, // Membatasi teks hingga 2 baris
                    overflow: TextOverflow.ellipsis,
                    "Festival Budaya merupakan sebuah acara tahunan yang diadakan di Desa Jatiluwih, Kabupaten Badung, Bali. Festival ini bertujuan untuk melestarikan seni, adat, dan budaya Bali, khususnya yang ada di Desa Sangeh",
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9fa5a9),
                      height: 23 / 10,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
