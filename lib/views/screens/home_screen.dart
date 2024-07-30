import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/views/screens/detail_berita_screen.dart';
import 'package:sidewi_mobile_app/views/screens/list_desa_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/category_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/header_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/search_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/destinasi_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/search_widget_statis.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Rintisan';
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print(selectedCategory);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 192,
              maxHeight: 192,
              child: Container(
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 64,
                      ),
                      HeaderWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      SearchWidgetStatis()
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  // Category
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 12,
                    ),
                    child: Container(
                        width: double.infinity,
                        child: ListCategoryWidget(
                          onCategorySelected: (category) {
                            setState(() {
                              selectedCategory = category;
                              _scrollController.jumpTo(0.0);
                            });
                          },
                        )),
                  ),

                  // List Wisata
                  SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        width: double.infinity,
                        child: DestinasiWidgetListHorizontal(
                          kategori: selectedCategory,
                          scrollController: _scrollController,
                        )),
                  ),

                  // Text
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 36, left: 24, right: 24, bottom: 28),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Destinasi lain",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 24 / 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: MyColors.mainGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: Transform.scale(
                                  scale: 1.5,
                                  child: SvgPicture.asset(
                                      'assets/icons/ic_next.svg')),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ListDesaScreen()));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Destinasi lain section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: DestinasiWidgetListVertical(),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
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
