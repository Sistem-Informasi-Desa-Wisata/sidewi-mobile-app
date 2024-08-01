import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/views/widgets/input_rating_widget.dart';
import 'package:sidewi_mobile_app/viewmodels/review_viewmodel.dart';

class ReviewScreen extends StatefulWidget {
  final int id_akun;
  final int id_destinasiwisata;
  const ReviewScreen(
      {required this.id_akun, required this.id_destinasiwisata, super.key});
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    final reviewViewModel =
        Provider.of<ReviewViewModel>(context, listen: false);
    reviewViewModel.setRating(0);
  }

  @override
  Widget build(BuildContext context) {
    final reviewViewModel = Provider.of<ReviewViewModel>(context);
    final TextEditingController reviewController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
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
                                'assets/icons/ic_back_black.svg'),
                          ),
                          Expanded(
                            child: Center(
                              child: SizedBox(
                                child: Text(
                                  "Review",
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
                        SizedBox(height: 24),
                        Text(
                          "Bagikan Ulasan Anda",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                            height: 20 / 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32, bottom: 12),
                          child: Text(
                            "Berikan rating wisata ini",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                              height: 15 / 12,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Center(
                          child: StarRatingInput(
                            starCount: 5,
                            size: 40.0, // Ukuran ikon SVG
                            onRatingChanged: (rating) {
                              reviewViewModel.setRating(rating);
                            },
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          "Berikan ulasan wisata ini",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            height: 15 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 12),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: reviewController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Masukan ulasan anda ...',
                                hintStyle: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff9fa5a9),
                                  height: 15 / 12,
                                ),
                              ),
                              maxLines: null,
                              expands: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () async {
                            print("rating: ${reviewViewModel.rating}");
                            if (reviewViewModel.rating == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Rating tidak boleh kosong."),
                                ),
                              );
                              return;
                            } else {
                              final success = await reviewViewModel.addReview(
                                widget.id_akun,
                                widget.id_destinasiwisata,
                                reviewController.text,
                              );
                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Ulasan berhasil ditambahkan!"),
                                  ),
                                );
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Gagal menambahkan ulasan."),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                "Tambah Ulasan",
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
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
          if (reviewViewModel.isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(),
              ),
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
