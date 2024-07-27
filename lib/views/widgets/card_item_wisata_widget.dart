import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/viewmodels/destinasiwisata_viewmodel.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class CardItemWisataWidget extends StatefulWidget {
  final DestinasiWisataModel destinasiwisata;
  final VoidCallback? onTap;

  const CardItemWisataWidget({
    super.key,
    required this.destinasiwisata,
    this.onTap,
  });

  @override
  State<CardItemWisataWidget> createState() => _CardItemWisataWidgetState();
}

class _CardItemWisataWidgetState extends State<CardItemWisataWidget> {
  bool _isFavorite = true;
  String? kategoriNama;
  double? rating = 0.0;
  // bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchCategoryName();
      fetchRating();
    });
  }

  Future<void> fetchCategoryName() async {
    final viewModel =
        Provider.of<DestinasiWisataViewModel>(context, listen: false);
    try {
      String? name = await viewModel
          .getCategoryName(widget.destinasiwisata.id_kategoridestinasi);
      print("result fetchCategoryName: $name");

      if (mounted) {
        setState(() {
          kategoriNama = name;
          print("setState fetchCategoryName: $kategoriNama");
        });
      }
    } catch (e) {
      print("error fetchCategoryName : $e");
    } 
  }

  Future<void> fetchRating() async {
    final viewModel =
        Provider.of<DestinasiWisataViewModel>(context, listen: false);
    try {
      double? result = await viewModel
          .fetchAndCalculateAverageRating(widget.destinasiwisata.id);
      print("result fetchRating: $result");
      if (mounted) {
        setState(() {
          rating = result;
          print("setState fetchRating: $rating");
        });
      }
    } catch (e) {
      print("error fetchRating : $e");
    } 
  }

  @override
  Widget build(BuildContext context) {
    print("widget categoryname: $kategoriNama");
    print("widget rating: $rating");
    final imageProvider = (widget.destinasiwisata.gambar != null &&
            widget.destinasiwisata.gambar.isNotEmpty)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/destinasiwisata/${widget.destinasiwisata.gambar}')
        : AssetImage('assets/images/DefaultImage.jpg') as ImageProvider;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
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
                    left: 12, bottom: 12, right: 8, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/ic_star.svg',
                                width: 16, height: 16),
                            SizedBox(width: 4),
                            Text(
                              rating != null ? rating.toString() : '0.0',
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                          child: SvgPicture.asset(
                            _isFavorite
                                ? 'assets/icons/ic_favorite_active.svg'
                                : 'assets/icons/ic_favorite_nonactive.svg',
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      widget.destinasiwisata.nama,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      kategoriNama != null ? '$kategoriNama' : '',
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 16.4 / 10,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.destinasiwisata.deskripsi,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
