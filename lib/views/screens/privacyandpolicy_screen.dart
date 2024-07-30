import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            child: Text(
                              "Privacy Policy",
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  teksWidget(
                      headtext: "1. Pendahuluan",
                      childtext:
                          'Selamat datang di aplikasi Sidewi ("kami", "kita", atau "milik kami"). Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda ketika Anda menggunakan aplikasi kami.'),
                  SizedBox(
                    height: 12,
                  ),
                  teksWidget(
                    headtext: "2. Informasi yang Kami Kumpulkan",
                    childtext:
                        'Kami dapat mengumpulkan informasi berikut dari Anda:'
                        '• Informasi Identitas: Nama, alamat email, nomor telepon, dan data identitas lainnya.\n'
                        '• Informasi Lokasi: Data lokasi yang dikumpulkan dari perangkat Anda saat Anda menggunakan layanan berbasis lokasi.\n'
                        '• Informasi Penggunaan: Informasi tentang bagaimana Anda berinteraksi dengan aplikasi kami, termasuk preferensi dan riwayat pencarian.\n'
                        '• Informasi Perangkat: Informasi tentang perangkat yang Anda gunakan untuk mengakses aplikasi, termasuk model perangkat, sistem operasi, dan pengidentifikasi unik perangkat.',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  teksWidget(headtext: "3. Penggunaan Informasi", childtext: '''
Kami menggunakan informasi yang kami kumpulkan untuk:
• Menyediakan dan memelihara layanan aplikasi kami.
• Mengirimkan komunikasi terkait layanan, seperti konfirmasi pemesanan dan pembaruan penting.
• Menyediakan konten yang dipersonalisasi dan rekomendasi berdasarkan preferensi dan lokasi Anda.
• Meningkatkan kualitas layanan dan pengalaman pengguna dengan melakukan analisis data.
• Memenuhi kewajiban hukum dan peraturan.
'''),
                  teksWidget(headtext: "4. Berbagi Informasi", childtext: '''
Kami tidak akan menjual, menyewakan, atau menukar informasi pribadi Anda dengan pihak ketiga tanpa persetujuan Anda, kecuali dalam keadaan berikut:
• Dengan penyedia layanan pihak ketiga yang membantu kami dalam menjalankan aplikasi dan memberikan layanan kepada Anda.
• Jika diwajibkan oleh hukum atau sebagai bagian dari proses hukum.
• Untuk melindungi hak, privasi, keselamatan, atau properti kami dan pengguna lainnya.
''')
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}

class teksWidget extends StatelessWidget {
  const teksWidget(
      {super.key, required this.headtext, required this.childtext});

  final String headtext;
  final String childtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headtext,
          // "1. Pendahuluan",
          style: const TextStyle(
            fontFamily: "Montserrat",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
            height: 15 / 12,
          ),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            childtext,
            style: const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
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
