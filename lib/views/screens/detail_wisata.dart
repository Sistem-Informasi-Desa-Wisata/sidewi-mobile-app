import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/views/screens/review_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/ReviewCardWidget.dart';
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class DetailWisataScreen extends StatelessWidget {
  final DestinasiWisataModel destinasiwisata;
  final String desa;
  const DetailWisataScreen(
      {Key? key, required this.destinasiwisata, required this.desa});
  @override
  @override
  Widget build(BuildContext context) {
    final imageProvider = (destinasiwisata.gambar != null &&
            destinasiwisata.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/destinasiwisata/${destinasiwisata.gambar}')
        : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(slivers: [
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
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
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
                            "Wisata",
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
                                text: destinasiwisata.nama,
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

                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 24),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                          // child: Image.asset(
                          //   'assets/images/foto_dummy.jpg',
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Text(
                        destinasiwisata.deskripsi,
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

                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Divider(
                          color: Color(0xFF9FA5A9),
                          thickness: 1,
                        ),
                      ),
                      ReviewCardWidget(),

                      SizedBox(
                        height: 76,
                      )
                    ],
                  ),
                )
              ],
            ),
          ]))
        ]),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 76,
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReviewScreen()));
                  },
                  child: Container(
                    width: 260,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        "Berikan Ulasan",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 15 / 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
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
