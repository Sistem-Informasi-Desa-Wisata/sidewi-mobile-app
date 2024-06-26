import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/ui/widgets/ReviewCardWidget.dart';

class DetailWisataScreen extends StatelessWidget {
  const DetailWisataScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                                text: "Festival Budaya Sangeh",
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000),
                                  height: 20 / 16,
                                ),
                              ),
                              TextSpan(
                                text: " - Sangeh",
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
                        "25 Januari 2024",
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
                                image:
                                    AssetImage('assets/images/foto_dummy.jpg'),
                                fit: BoxFit.cover),
                          ),
                          // child: Image.asset(
                          //   'assets/images/foto_dummy.jpg',
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Text(
                        "Desa Sangeh, Terletak sekitar 35 km dari Bandara Internasional I Gusti Ngurah Rai, dapat ditempuh dalam waktu 1 jam. Daerah ini terletak di Desa Sangeh, Kecamatan Abiansemal, Kabupaten Badung.\n\n"
                        "Hutan Sangeh atau kadang-kadang disebut sebagai Hutan Pala dikenal dengan hutan seluas 13 hektar yang didominasi oleh pohon pala dan mayoritas penghuninya adalah kera abu-abu berekor panjang (Macaca fascicularis).\n\n"
                        "Berdasarkan pada mitologi, nama Sangeh terdiri dari dua kata, yaitu 'Sang' yang berarti 'manusia' dan 'Ngeh' yang berarti 'Lihat'. Jadi Sangeh dapat ditafsirkan sebagai orang yang 'Lihat'. Menurut legenda, hutan yang sekarang disebut Sangeh terjadi ketika seorang putri para Dewa dari Gunung Agung ingin pindah ke Mengwi. Di malam hari hutan pala juga berjalan untuk menemani Dewi. Namun, dalam perjalanan mereka, ada orang-orang yang melihat gerakan mereka, lalu hutan berhenti di sana hingga saat ini. Sang Dewi kemudian disebut sebagai memiliki kuilnya di Bukit Sari Temple, kuil di tengah Hutan Sangeh sementara prajuritnya dikutuk ke dalam monyet yang tetap setia untuk menemani Dewi di hutan.\n\n"
                        "Memasuki daerah ini, di Candi Bentar (gerbang), ada patung besar seorang kesatria raksasa, yaitu, kumbakarna diserang oleh puluhan kera. Patung itu menggambarkan kisah boneka Ramayana yang sangat terkenal di Bali. Sekitar Status Kumbakarna ada dua patung singa. Ada sebuah kuil kecil yang disebut Candi Melanting di tengah kawasan hutan dan kuil besar yang disebut Candi Pucak Sari. Di ujung jalan menuju jalan keluar, ada pohon pala suci yang sangat besar.\n\n"
                        "Pohon-pohon ini memiliki keunikan dan mereka disebut sebagai pohon Lanang dan Wadon (pohon jantan-betina). Ini bertiga dinamai demikian, karena pohon pala berbentuk seperti alat kelamin laki-laki dan perempuan yang saling berdampingan. Keajaiban pohon-pohon itu merupakan keunikan yang menarik di kawasan wisata sangeh",
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
                child: Container(
                  // width: 268,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColors.mainGrey,
                      hintText: 'Berikan Ulasan ...',
                      hintStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: MyColors.textGrey,
                        height: 12 / 12,
                      ),
                      border: OutlineInputBorder(
                        // Menggunakan OutlineInputBorder
                        borderRadius: BorderRadius.circular(
                            8.0), // Menetapkan border radius di sini
                        borderSide: BorderSide.none, // Tidak ada border tepi
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      suffixIcon: IconButton(
                        icon: Transform.scale(
                          scale: 1,
                          child: SvgPicture.asset(
                            'assets/icons/ic_send.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                        onPressed: () {
                          // Lakukan sesuatu ketika tombol pencarian ditekan
                          print('Search button pressed');
                        },
                      ),
                    ),
                    onChanged: null,
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
