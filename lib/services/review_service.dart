import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/review_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart'; // Update with your actual path

class ReviewService {
  final String baseUrl = ApiConfig.baseUrl;

  Future<List<ReviewModel>> fetchReviewList() async {
    final response = await http.get(Uri.parse('$baseUrl/reviewdestinasi'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ReviewModel> reviewList =
          body.map((dynamic item) => ReviewModel.fromJson(item)).toList();
      return reviewList;
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  Future<List<ReviewModel>> fetchReviewByIdDestinasi(int id) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/reviewdestinasi/destinasi/$id'));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        List<dynamic> filteredBody =
            body.where((item) => item['setujui'] == 1).toList();

        filteredBody.sort((a, b) {
          DateTime dateA = DateTime.parse(a['createdAt']);
          DateTime dateB = DateTime.parse(b['createdAt']);
          return dateB.compareTo(dateA);
        });

        List<ReviewModel> reviewList = filteredBody
            .map((dynamic item) => ReviewModel.fromJson(item))
            .toList();
        return reviewList;
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (e) {
      throw Exception('Failed to fetch reviews: $e');
    }
  }

  Future<List<ReviewModel>> fetchLimitedReviewByIdDestinasi(int id,
      {int? limit}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/reviewdestinasi/destinasi/$id'));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        List<dynamic> filteredBody =
            body.where((item) => item['setujui'] == 1).toList();

        filteredBody.sort((a, b) {
          DateTime dateA = DateTime.parse(a['createdAt']);
          DateTime dateB = DateTime.parse(b['createdAt']);
          return dateB.compareTo(dateA);
        });

        List<ReviewModel> reviewList = filteredBody
            .map((dynamic item) => ReviewModel.fromJson(item))
            .toList();
        if (limit != null) {
          reviewList = reviewList.take(limit).toList();
        }
        reviewList.forEach((review) => print(review.toString()));
        return reviewList;
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (e) {
      throw Exception('Failed to fetch reviews: $e');
    }
  }

  Future<int> countReview(int id, {int? limit}) async {
    try {
      List<ReviewModel> reviewList =
          await fetchLimitedReviewByIdDestinasi(id, limit: limit);
      return reviewList.length;
    } catch (e) {
      throw Exception('Failed to count reviews: $e');
    }
  }

  Future<bool> addReview(int id_akun, int id_destinasiwisata, int rating,
      String reviewText) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reviewdestinasi/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_akun': id_akun,
        'id_destinasiwisata': id_destinasiwisata,
        'rating': rating,
        'review': reviewText,
      }),
    );

    print('Status Code: ${response.statusCode}');
    print(
        'Response Body: ${response.body}'); // Print the response body for debugging

    if (response.statusCode == 200) {
      return true;
    } else {
      // Print the error response body to get more details on the issue
      print('Error Response: ${response.body}');
      return false;
    }
  }
}
