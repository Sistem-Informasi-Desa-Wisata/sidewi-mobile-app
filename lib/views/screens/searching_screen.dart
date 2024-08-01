import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:sidewi_mobile_app/views/widgets/destinasi_widget.dart';
import 'package:sidewi_mobile_app/views/widgets/search_widget.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

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
                    SearchWidget(
                      onSearchChanged: (searchQuery) {
                        setState(() {
                          this.searchQuery = searchQuery;
                        });
                        Provider.of<DesaWisataViewModel>(context, listen: false)
                            .fetchDesaWisataBySearch(
                                searchQuery, authViewModel.user!.id);
                      },
                    )
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
                    child:
                        DestinasiWidgetListVertical(searchQuery: searchQuery),
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
  final String searchQuery;
  const DestinasiWidgetListVertical({super.key, required this.searchQuery});

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

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

      Provider.of<DesaWisataViewModel>(context, listen: false)
          .fetchDesaWisataBySearch("", authViewModel.user!.id)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final desaProvider = Provider.of<DesaWisataViewModel>(context);

    if (desaProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (desaProvider.desaWisataSearchList.isEmpty &&
        widget.searchQuery.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
            child: Container(
          width: 180,
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/ic_empty.svg',
                height: 128, // Set the height of the picture to 16
              ),
              SizedBox(height: 16),
              // Add some spacing between the SVG and the text
              Text("Pencarian desa tidak ditemukan"),
            ],
          ),
        )),
      );
    }

    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: desaProvider.desaWisataSearchList.length,
          itemBuilder: (context, index) {
            DesaWisataModel desaWisata =
                desaProvider.desaWisataSearchList[index];
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
