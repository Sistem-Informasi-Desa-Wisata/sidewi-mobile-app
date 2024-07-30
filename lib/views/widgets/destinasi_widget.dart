import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';
import 'package:sidewi_mobile_app/colors.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/viewmodels/desawisata_viewmodel.dart';
import 'package:sidewi_mobile_app/views/screens/detail_desa_screen.dart';

class DestinasiWidgetListHorizontal extends StatefulWidget {
  final String kategori;
  final ScrollController scrollController;

  const DestinasiWidgetListHorizontal({
    super.key,
    required this.kategori,
    required this.scrollController,
  });

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
      Provider.of<DesaWisataViewModel>(context, listen: false)
          .fetchDesaWisataByKategori()
          .then((_) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

  @override
  void didUpdateWidget(covariant DestinasiWidgetListHorizontal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.kategori != oldWidget.kategori) {
      // Scroll ke posisi awal saat kategori berubah
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (widget.scrollController.hasClients) {
          widget.scrollController.jumpTo(0.0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final desaWisataViewModel = Provider.of<DesaWisataViewModel>(context);
    List<DesaWisataModel> desaWisataList;

    if (desaWisataViewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    switch (widget.kategori) {
      case "Rintisan":
        desaWisataList = desaWisataViewModel.desaWisataRintisanList;
        break;
      case "Berkembang":
        desaWisataList = desaWisataViewModel.desaWisataBerkembangList;
        break;
      case "Maju":
        desaWisataList = desaWisataViewModel.desaWisataMajuList;
        break;
      case "Mandiri":
        desaWisataList = desaWisataViewModel.desaWisataMandiriList;
        break;
      default:
        desaWisataList = [];
    }

    return Container(
      height: 160,
      child: ListView.builder(
          controller: widget.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: min(desaWisataList.length, 8),
          itemBuilder: (context, index) {
            DesaWisataModel desaWisata = desaWisataList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: DestinasiItemsWidget(desaWisata: desaWisata),
            );
          }),
    );
  }
}

class DestinasiItemsWidget extends StatefulWidget {
  final DesaWisataModel desaWisata;

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
    final imageProvider = (widget.desaWisata.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/desawisata/${widget.desaWisata.gambar}')
        : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;

    return Stack(
      children: [
        Container(
          width: 230,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(id: widget.desaWisata.id),
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
      Provider.of<DesaWisataViewModel>(context, listen: false)
          .fetchRandomDesaWisata()
          .then((_) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final desaWisataViewModel = Provider.of<DesaWisataViewModel>(context);

    if (desaWisataViewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: min(desaWisataViewModel.desaWisataRandomList.length, 10),
          itemBuilder: (context, index) {
            DesaWisataModel desaWisata =
                desaWisataViewModel.desaWisataRandomList[index];
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

  final DesaWisataModel desaWisata;

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
                DetailScreen(id: widget.desaWisata.id),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(id: widget.desaWisata.id),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 95,
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
