import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailDesaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Desa Sangeh, Terletak sekitar 35 km dari Bandara Internasional I Gusti Ngurah Rai, dapat ditempuh dalam waktu 1 jam. Daerah ini terletak di Desa Sangeh, Kecamatan Abiansemal, Kabupaten Badung.\n\n"
            "Hutan Sangeh atau kadang-kadang disebut sebagai Hutan Pala dikenal dengan hutan seluas 13 hektar yang didominasi oleh pohon pala dan mayoritas penghuninya adalah kera abu-abu berekor panjang (Macaca fascicularis).\n\n"
            "Berdasarkan pada mitologi, nama Sangeh terdiri dari dua kata, yaitu 'Sang' yang berarti 'manusia' dan 'Ngeh' yang berarti 'Lihat'. Jadi Sangeh dapat ditafsirkan sebagai orang yang 'Lihat'. Menurut legenda, hutan yang sekarang disebut Sangeh terjadi ketika seorang putri para Dewa dari Gunung Agung ingin pindah ke Mengwi. Di malam hari hutan pala juga berjalan untuk menemani Dewi. Namun, dalam perjalanan mereka, ada orang-orang yang melihat gerakan mereka, lalu hutan berhenti di sana hingga saat ini. Sang Dewi kemudian disebut sebagai memiliki kuilnya di Bukit Sari Temple, kuil di tengah Hutan Sangeh sementara prajuritnya dikutuk ke dalam monyet yang tetap setia untuk menemani Dewi di hutan.\n\n",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
              height:
                  1.0, // Sesuaikan dengan jenis font dan ukuran yang digunakan
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Lokasi",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
              height: 20 / 16,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 200,
              width: double.infinity,
              // child: WebMap(),
              // Optional: Adjust width if needed
              child: Image.asset(
                'assets/images/dummymap.png', // Path to your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Kontak",
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
              height: 20 / 16,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Facebook",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                  height: 15 / 12,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Instagram",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                  height: 15 / 12,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "Website",
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                  height: 15 / 12,
                ),
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ),
    );
  }
}
