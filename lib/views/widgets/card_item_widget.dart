import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/berita_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:intl/intl.dart';

class CardItemWidget extends StatelessWidget {
  final BeritaModel berita;
  const CardItemWidget({super.key, this.onTap, required this.berita});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final imageProvider = (berita.gambar != null && berita.gambar.isNotEmpty)
        ? NetworkImage('${ApiConfig.baseUrl}/resource/berita/${berita.gambar}')
        : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
                            DateFormat('yyyy-MM-dd').format(berita.createdAt),
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
                            berita.judul,
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
                              berita.isiBerita,
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
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
