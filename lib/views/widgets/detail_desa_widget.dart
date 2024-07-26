import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sidewi_mobile_app/views/widgets/webView_map_wdiget.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/models/informasidesawisata_model.dart';

class DetailDesaWidget extends StatelessWidget {
  final DesaWisataModel detail;
  final InformasiDesaWisataModel informasi;
  const DetailDesaWidget(
      {super.key, required this.detail, required this.informasi});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detail.deskripsi,
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
              height:
                  1.0, // Sesuaikan dengan jenis font dan ukuran yang digunakan
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Lokasi : ${detail.alamat}",
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
          Material(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MapPage(maps: detail.maps)),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "No telp : ${informasi.no_telp}",
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
          Text(
            "Whatsapp : ${informasi.no_wa}",
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
                "Facebook : ${informasi.facebook}",
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
                "Instagram : ${informasi.email}",
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
                "Website ${informasi.website}",
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
