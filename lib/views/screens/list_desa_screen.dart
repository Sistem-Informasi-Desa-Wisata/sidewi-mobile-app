import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/screens/detail_desa_screen.dart';

class ListDesaScreen extends StatelessWidget {
  const ListDesaScreen({super.key});

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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<DesaWisataViewModel>(context, listen: false)
          .fetchDesaWisata()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final desaWisataViewModel = Provider.of<DesaWisataViewModel>(context);

    if (desaWisataViewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
                            child: Container(
                              child: Text(
                                "Desa Wisata",
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
                  SizedBox(height: 32),
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
                          Tab(text: 'Rintisan'),
                          Tab(text: 'Berkembang'),
                          Tab(text: 'Maju'),
                          Tab(text: 'Mandiri'),
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
                Rintisan(),
                Berkembang(),
                Maju(),
                Mandiri(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Rintisan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListDesaWidget();
  }
}

class Berkembang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListDesaWidget();
  }
}

class Maju extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListDesaWidget();
  }
}

class Mandiri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListDesaWidget();
  }
}

class ListDesaWidget extends StatelessWidget {
  const ListDesaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final desaWisataViewModel = Provider.of<DesaWisataViewModel>(context);
    final desaWisataList = desaWisataViewModel.desaWisataList;

    return GridView.builder(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      itemCount: desaWisataList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.90,
      ),
      itemBuilder: (context, index) {
        DesaWisataModel desaWisata = desaWisataList[index];
        return DesaItemWidget(desaWisata: desaWisata);
      },
    );
  }
}

class DesaItemWidget extends StatefulWidget {
  final DesaWisataModel desaWisata;

  const DesaItemWidget({super.key, required this.desaWisata});

  @override
  _DesaItemWidgetState createState() => _DesaItemWidgetState();
}

class _DesaItemWidgetState extends State<DesaItemWidget> {
  late bool _isFavorite = true;

  @override
  void initState() {
    super.initState();
    // _isFavorite = widget.desaWisata.isFavorite; // Assuming `isFavorite` field
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration:
                  Duration(milliseconds: 500), // Transition duration
              pageBuilder: (context, animation, secondaryAnimation) =>
                  DetailScreen(id: widget.desaWisata.id),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var fadeAnimation =
                    Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.ease,
                ));
                return FadeTransition(opacity: fadeAnimation, child: child);
              },
            ),
          );
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
                    image: AssetImage(
                        'assets/images/foto_berita.png'), // Update with actual image URL if needed
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
                                        milliseconds:
                                            500), // Transition duration
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        DetailScreen(id: widget.desaWisata.id),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var fadeAnimation =
                                          Tween(begin: 0.0, end: 1.0)
                                              .animate(CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.ease,
                                      ));
                                      return FadeTransition(
                                          opacity: fadeAnimation, child: child);
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
                                      !_isFavorite; // Toggle favorite status
                                });
                                // Optionally, update favorite status in the ViewModel or API
                              },
                              child: _isFavorite
                                  ? SvgPicture.asset(
                                      'assets/icons/ic_favorite_active.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/ic_favorite_nonactive.svg'),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.desaWisata.nama,
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
                            widget.desaWisata
                                .alamat, // Assuming there's a location field
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 10 / 8,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
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
