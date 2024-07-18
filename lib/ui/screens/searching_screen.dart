import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/models/response/desawisata_response_model.dart';
import 'package:sidewi_mobile_app/provider/desa_provider.dart';
import 'package:sidewi_mobile_app/ui/widgets/destinasi_widget.dart';
import 'package:sidewi_mobile_app/ui/widgets/search_widget.dart';

class SearchingScreen extends StatelessWidget {
  const SearchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
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
                    Padding(
                      padding: const EdgeInsets.only(top: 62),
                      child: Row(
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
                                  "Pencarian",
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
                    SizedBox(
                      height: 20,
                    ),
                    SearchWidget()
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    child: Text(
                      "Pencarian anda",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        height: 20 / 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    child: DestinasiWidgetListVertical(),
                  )
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}

class DestinasiWidgetListVertical extends StatefulWidget {
  const DestinasiWidgetListVertical({super.key});

  @override
  State<DestinasiWidgetListVertical> createState() =>
      _DestinasiWidgetListVerticalState();
}

class _DestinasiWidgetListVerticalState
    extends State<DestinasiWidgetListVertical> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Gunakan WidgetsBinding untuk memanggil fetchDesa setelah build selesai
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<DesaProvider>(context, listen: false).fetchDesa().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final desaProvider = Provider.of<DesaProvider>(context);

    if (desaProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: desaProvider.desaList.length,
          itemBuilder: (context, index) {
            DesaWisata desaWisata = desaProvider.desaList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: DestinasiItemsWidgetVertical(desaWisata: desaWisata),
            );
          }),
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