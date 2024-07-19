import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/models/berita_model.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:intl/intl.dart';


class DetailBeritaScreen extends StatelessWidget {
  final BeritaModel berita;
  final String desa;
  const DetailBeritaScreen(
      {Key? key, required this.berita, required this.desa});
  @override
  Widget build(BuildContext context) {
    print(berita.gambar);
    final imageProvider = (berita.gambar != null && berita.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/berita/${berita.gambar}')
        : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              maxHeight: 112,
              minHeight: 112,
              child: Container(
                height: 112,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                              'assets/icons/ic_back_black.svg')),
                      SizedBox(
                        child: Text(
                          "Berita",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            height: 20 / 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                          onPressed: null,
                          icon: SvgPicture.asset(
                              'assets/icons/ic_share_black.svg'))
                    ],
                  ),
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // tittle
                    Row(
                      children: [
                        // tittle Section
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: berita.judul,
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                                height: 20 / 16,
                              ),
                            ),
                            TextSpan(
                              text: " - $desa",
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF9FA5A9),
                                height: 20 / 16,
                              ),
                            )
                          ]),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(berita.createdAt),
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                        height: 15 / 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover),
                        ),
                        // child: Image.asset(
                        //   'assets/images/foto_dummy.jpg',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                    Text(
                      berita.isiBerita,
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
                    )
                  ],
                ),
              )
            ],
          ),
        ]))
      ]),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
