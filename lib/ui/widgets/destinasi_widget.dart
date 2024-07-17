import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/models/response/desawisata_response_model.dart';
import 'package:sidewi_mobile_app/provider/desa_provider.dart';
import 'package:sidewi_mobile_app/ui/screens/detail_screen.dart';

class DestinasiWidgetListHorizontal extends StatefulWidget {
  const DestinasiWidgetListHorizontal({super.key});

  @override
  State<DestinasiWidgetListHorizontal> createState() =>
      _DestinasiWidgetListHorizontalState();
}

class _DestinasiWidgetListHorizontalState
    extends State<DestinasiWidgetListHorizontal> {
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

    return Container(
      height: 160,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: desaProvider.desaList.length,
          itemBuilder: (context, index) {
            DesaWisata desaWisata = desaProvider.desaList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: DestinasiItemsWidget(desaWisata: desaWisata),
            );
          }),
    );
  }
}

class DestinasiItemsWidget extends StatefulWidget {
  final DesaWisata desaWisata;

  const DestinasiItemsWidget({
    super.key,
    required this.desaWisata,
  });

  @override
  State<DestinasiItemsWidget> createState() => _DestinasiItemsWidgetState();
}

class _DestinasiItemsWidgetState extends State<DestinasiItemsWidget> {
  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    print('Nama Desa: ${widget.desaWisata.nama}');
    print('Kabupaten: ${widget.desaWisata.kabupaten}');
    print('Gambar: ${widget.desaWisata.gambar}');
    return Stack(
      children: [
        Container(
          width: 230,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
                image: widget.desaWisata.gambar != null
                    ? NetworkImage(
                        'http://8.215.11.162:3000/resource/desawisata/${widget.desaWisata.gambar}')
                    // ? AssetImage('assets/images/lokasi_foto.png')
                    : AssetImage('assets/images/foto_berita.jpg')
                        as ImageProvider,
                fit: BoxFit.cover),
          ),
        ),
        Container(
          width: 230,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
              colors: [
                Color(0XFF0000001F)
                    .withOpacity(0.12), // Warna pertama dengan opacity 0.8
                Color(0XFF0000001F)
                    .withOpacity(0.6), // Warna kedua dengan opacity 0.5
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 18),
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
                              transitionDuration:
                                  Duration(milliseconds: 500), // Durasi animasi
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
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
                      // "Sangeh",
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
                      widget.desaWisata.kabupaten,
                      // "Kabupaten Badung",
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
        )
      ],
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
          itemCount: min(desaProvider.desaList.length, 10),
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

class DestinasiItemsWidgetVertical extends StatefulWidget {
  const DestinasiItemsWidgetVertical({super.key, required this.desaWisata});

  final DesaWisata desaWisata;

  @override
  State<DestinasiItemsWidgetVertical> createState() =>
      _DestinasiItemsWidgetVerticalState();
}

class _DestinasiItemsWidgetVerticalState
    extends State<DestinasiItemsWidgetVertical> {
  bool _isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500), // Durasi animasi
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: widget.desaWisata.gambar != null
                      ? NetworkImage(
                          'http://8.215.11.162:3000/resource/desawisata/${widget.desaWisata.gambar}')
                      // ? AssetImage('assets/images/lokasi_foto.png')
                      : AssetImage('assets/images/dummy_foto.png')
                          as ImageProvider,
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                colors: [
                  Color(0XFF0000001F)
                      .withOpacity(0.12), // Warna pertama dengan opacity 0.8
                  Color(0XFF0000001F)
                      .withOpacity(0.6), // Warna kedua dengan opacity 0.5
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 79),
                      child: Text(
                        // "Tenganan Pegringsingan",
                        widget.desaWisata.kabupaten,
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 15 / 12,
                        ),
                        textAlign: TextAlign.left,
                      )),
                  Text(
                    // "Kabupaten Karangasem",
                    widget.desaWisata.kabupaten,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      height: 12 / 10,
                    ),
                    textAlign: TextAlign.left,
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
