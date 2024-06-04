import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/ui/widgets/berita_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/produk_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/wisata_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundDetail(),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: 376,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 60, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(
                                  'assets/icons/ic_back_white.svg')),
                          IconButton(
                              onPressed: null,
                              icon:
                                  SvgPicture.asset('assets/icons/ic_share.svg'))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    height: 800,
                    child: DetailPage(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Heading tab pagination section
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 1),
                  blurRadius: 24,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sangeh",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                              height: 29 / 24,
                            ),
                          ),
                          Text(
                            "Kabupaten Badung",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000),
                              height: 15 / 12,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                // Aksi ketika tombol ditekan
                              },
                              child: SvgPicture.asset(
                                  'assets/icons/ic_full_love.svg')),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  // Tab Bar Section
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      height: 25,
                      child: TabBar(
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 0.1,
                        dividerColor: Colors.white,
                        indicatorPadding: EdgeInsets.symmetric(vertical: 0.1),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: 'Detail',
                          ),
                          Tab(text: 'Berita'),
                          Tab(text: 'Wisata'),
                          Tab(text: 'Produk'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tab Bar View Section
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DetailTab(),
                BeritaTab(),
                WisataTab(),
                ProdukTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailTab extends StatelessWidget {
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
              width: double.infinity, // Optional: Adjust width if needed
              child: Image.asset(
                'assets/images/lokasi_foto.png', // Path to your image asset
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
          )
        ],
      ),
    );
  }
}

class BeritaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListBeritaWidget();
  }
}

class WisataTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListWisataWidget();
  }
}

class ProdukTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListProdukWidget();
  }
}

class BackgroundDetail extends StatelessWidget {
  const BackgroundDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 400,
      // child: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       IconButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: SvgPicture.asset('assets/icons/ic_back_white.svg')),
      //       IconButton(
      //           onPressed: null,
      //           icon: SvgPicture.asset('assets/icons/ic_share.svg'))
      //     ],
      //   ),
      // ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/detail_foto.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
