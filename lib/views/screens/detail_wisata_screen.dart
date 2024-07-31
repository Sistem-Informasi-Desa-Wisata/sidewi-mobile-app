import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/views/screens/review_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/container-review.dart';
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:sidewi_mobile_app/viewmodels/review_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';

class DetailWisataScreen extends StatefulWidget {
  final DestinasiWisataModel destinasiwisata;
  final String desa;

  const DetailWisataScreen(
      {Key? key, required this.destinasiwisata, required this.desa})
      : super(key: key);
  @override
  _DetailWisataScreenState createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  @override
  void initState() {
    super.initState();
    // perubahan ini menggunakan addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final reviewViewModel =
          Provider.of<ReviewViewModel>(context, listen: false);
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      reviewViewModel.fetchLimitedReviewByIdDestinasi(
          widget.destinasiwisata.id, authViewModel.accessToken,
          limit: 3);
      reviewViewModel.countReview(widget.destinasiwisata.id, limit: 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = (widget.destinasiwisata.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/destinasiwisata/${widget.destinasiwisata.gambar}')
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
                          Container(
                            width: 300,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: widget.destinasiwisata.nama,
                                  style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    height: 20 / 16,
                                  ),
                                ),
                                TextSpan(
                                  text: " - ${widget.desa}",
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
                        widget.destinasiwisata.deskripsi,
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

                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Divider(
                          color: Color(0xFF9FA5A9),
                          thickness: 1,
                        ),
                      ),
                      Consumer<ReviewViewModel>(
                        builder: (context, reviewViewModel, child) {
                          return ContainerReviewWidget(
                            id: widget.destinasiwisata.id,
                          );
                        },
                      ),

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
                child: Consumer<AuthViewModel>(
                  builder: (context, authViewModel, child) {
                    return GestureDetector(
                      onTap: () {
                        if (authViewModel.user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewScreen(
                                id_akun: authViewModel.user!.id,
                                id_destinasiwisata: widget.destinasiwisata.id,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Anda harus login untuk menambah ulasan."),
                            ),
                          );
                        }
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
                    );
                  },
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
