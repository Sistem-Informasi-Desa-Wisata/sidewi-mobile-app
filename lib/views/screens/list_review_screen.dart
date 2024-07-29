import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sidewi_mobile_app/viewmodels/review_viewmodel.dart';
import 'package:sidewi_mobile_app/models/review_model.dart';
import 'package:sidewi_mobile_app/views/screens/review_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/rating_widget.dart';
import 'package:sidewi_mobile_app/viewmodels/auth_viewmodel.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class ListReviewScreen extends StatefulWidget {
  final int id;

  const ListReviewScreen({super.key, required this.id});

  @override
  _ListReviewScreenState createState() => _ListReviewScreenState();
}

class _ListReviewScreenState extends State<ListReviewScreen> {
  late ReviewViewModel reviewViewModel;
  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final reviewViewModel =
          Provider.of<ReviewViewModel>(context, listen: false);
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      reviewViewModel.fetchReviewByIdDestinasi(
          widget.id, authViewModel.accessToken);
    });
  }

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

class ListReview extends StatefulWidget {
  const ListReview({super.key});

  @override
  _ListReviewState createState() => _ListReviewState();
}

class _ListReviewState extends State<ListReview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewViewModel>(
      builder: (context, reviewViewModel, child) {
        if (reviewViewModel.reviewList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 6),
          scrollDirection: Axis.vertical,
          itemCount: reviewViewModel.reviewList.length,
          itemBuilder: (context, index) {
            final review = reviewViewModel.reviewList[index];
            return ReviewItemWidget(review: review);
          },
        );
      },
    );
  }
}

class ReviewItemWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewItemWidget({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = (review.foto != null)
        ? NetworkImage('${ApiConfig.baseUrl}/resource/akun/${review.foto}')
        : AssetImage('assets/images/DefaultProfile.jpg') as ImageProvider;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
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
                        image: imageProvider,
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
                                  // review.id_akun.toString(),
                                  review.userName ?? "User",
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
                                  "${review.createdAt.day} ${review.createdAt.month}, ${review.createdAt.year}",
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
                                rating: review.rating,
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
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 300,
            child: Text(
              review.review,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.justify,
            ),
          )
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
