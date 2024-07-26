import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidewi_mobile_app/views/screens/list_review_screen.dart';
import 'package:sidewi_mobile_app/views/widgets/rating_widget.dart';
import 'package:sidewi_mobile_app/viewmodels/review_viewmodel.dart';
import 'package:sidewi_mobile_app/models/review_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class ContainerReviewWidget extends StatelessWidget {
  final int id;
  const ContainerReviewWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final reviewViewModel = Provider.of<ReviewViewModel>(context);

    return reviewViewModel.isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Review",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                        height: 20 / 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${reviewViewModel.reviewCount} Komentar",
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000000),
                        height: 15 / 12,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 6),
                      scrollDirection: Axis.vertical,
                      itemCount: reviewViewModel.limitedReviewList.length,
                      itemBuilder: (context, index) {
                        final review = reviewViewModel.limitedReviewList[index];
                        return ReviewItemWidget(review: review);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListReviewScreen(id: id,)));
                    },
                    child: Container(
                      width: 300,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4), // Warna F4F4F4
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Lihat lainnya",
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                              onPressed: null,
                              icon:
                                  SvgPicture.asset('assets/icons/ic_more.svg'))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class ReviewItemWidget extends StatelessWidget {
  final ReviewModel review;
  const ReviewItemWidget({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = (review.foto != null)
        ? NetworkImage(
            '${ApiConfig.baseUrl}/resource/akun/${review.foto}')
        : AssetImage('assets/images/DefaultProfile.jpg') as ImageProvider;

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
                    Container(
                      width: 268,
                      child: Text(
                        review.review,
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
