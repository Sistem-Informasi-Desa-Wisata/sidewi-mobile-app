import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/widgets/berita_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/detail_desa_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/produk_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/wisata_widget.dart';

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

  bool _isFavorite = true;

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
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              child: _isFavorite == true
                                  ? SvgPicture.asset(
                                      'assets/icons/ic_full_love.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/ic_bottom_love_nonactive.svg')),
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
    return DetailDesaWidget();
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
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/detail_foto.png'),
            fit: BoxFit.cover),
      ),
    );
  }
}
