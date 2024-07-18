import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/screens/review_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/rating_widget.dart';

class ListReviewScreen extends StatelessWidget {
  const ListReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
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
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "List Review",
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
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListReview(),
            ),
          ]),
        ),
      ]),
    );
  }
}

class ListReview extends StatelessWidget {
  const ListReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap:
              true, // Set true agar ListView hanya mengambil ruang yang diperlukan
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 6),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ReviewItemWidget();
          }),
    );
  }
}

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 100,
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/user3.png'),
                      fit: BoxFit.cover, // Mengisi seluruh area container
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Visca",
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000),
                                  height: 20 / 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "20 Feb 2024",
                                style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9fa5a9),
                                  height: 12 / 10,
                                ),
                                textAlign: TextAlign.right,
                              )
                            ],
                          ),
                          Container(
                            child: StarRating(
                              rating: 3,
                              starCount: 5,
                              size: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 268,
                      child: Text(
                        "Taman Mumbul merupakan tempat suci bagi umat Hindu di Bali, dan sering digunakan untuk upacara Melasti",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
