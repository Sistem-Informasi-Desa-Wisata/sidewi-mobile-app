import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/screens/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailPage());
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
    _tabController = TabController(length: 2, vsync: this);
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
              padding: const EdgeInsets.only(top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Disukai",
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
                        labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                            text: 'Desa',
                          ),
                          Tab(text: 'Wisata'),
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
                Desa(),
                Wisata(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Desa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListWidget();
  }
}

class Wisata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListWidget();
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.90,
      ),
      itemBuilder: (context, index) {
        return ItemWidget();
      },
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailScreen()));
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/images/foto_berita.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFF00000000).withOpacity(0),
                      Color(0XFF00000000).withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, left: 8, right: 8, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(
                                        milliseconds: 500), // Durasi animasi
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        DetailScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                color: Colors.transparent,
                                height: 80,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            width: 24,
                            height: 24,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isFavorite =
                                        !_isFavorite; // Toggle nilai _isFavorite
                                  });
                                },
                                child: _isFavorite == true
                                    ? SvgPicture.asset(
                                        'assets/icons/ic_favorite_active.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/ic_favorite_nonactive.svg')),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sangeh",
                            // widget.desaWisata.nama,
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 15 / 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Kabupaten Badung",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 10 / 8,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
