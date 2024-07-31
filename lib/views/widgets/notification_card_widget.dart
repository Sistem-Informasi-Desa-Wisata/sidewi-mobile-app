import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/notifikasi_model.dart';

class NotificationCard extends StatelessWidget {
  final NotifikasiModel notifikasi;

  const NotificationCard({Key? key, required this.notifikasi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format tanggal dan waktu
    String formattedDate =
        '${notifikasi.createdAt.day.toString().padLeft(2, '0')} ${_getMonthName(notifikasi.createdAt.month)} ${notifikasi.createdAt.year}';
    String formattedTime =
        '${notifikasi.createdAt.hour.toString().padLeft(2, '0')}:${notifikasi.createdAt.minute.toString().padLeft(2, '0')}';

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
                      formattedDate,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
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
                      formattedTime,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
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
                  notifikasi.deskripsi,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9fa5a9),
                    height: 12 / 10,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
