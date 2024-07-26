import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/review_model.dart';
import 'package:sidewi_mobile_app/models/user_model.dart';
import 'package:sidewi_mobile_app/services/review_service.dart'; 
import 'package:sidewi_mobile_app/services/user_service.dart'; 


class ReviewViewModel extends ChangeNotifier {
  final ReviewService _reviewService = ReviewService();
  final UserService _userService = UserService();


  List<ReviewModel> _reviewList = [];
  List<ReviewModel> _limitedReviewList = [];
  List<ReviewModel> _reviewByDesaList = [];
  int _reviewCount = 0;
  bool _isLoading = true;
  String _errorMessage = '';
  int _rating = 0;

  List<ReviewModel> get reviewList => _reviewList;
  List<ReviewModel> get limitedReviewList => _limitedReviewList;
  List<ReviewModel> get reviewByDesaList => _reviewByDesaList;
  int get reviewCount => _reviewCount;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchReviewList(String accessToken) async {
    _isLoading = true;
    notifyListeners();

    try {
      _reviewList = await _reviewService.fetchReviewList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchReviewByIdDestinasi(int id, String? accessToken) async {
    _reviewList = [];
    _isLoading = true;
    notifyListeners();
    try {
      List<ReviewModel> fetchedReviews =
          await _reviewService.fetchReviewByIdDestinasi(id);
      _reviewList = fetchedReviews.toList();
      for (var review in _reviewList) {
        UserModel user =
            await _userService.fetchUserById(review.id_akun, accessToken);
        review.userName = user.nama;
        review.foto = user.foto;
      }
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      print("huh");
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLimitedReviewByIdDestinasi(int id, String? accessToken,
      {int? limit}) async {
    _limitedReviewList = [];
    _isLoading = true;
    notifyListeners();
    try {
      List<ReviewModel> fetchedReviews = await _reviewService
          .fetchLimitedReviewByIdDestinasi(id, limit: limit);
      _limitedReviewList = fetchedReviews.toList();
      for (var review in _limitedReviewList) {
        UserModel user =
            await _userService.fetchUserById(review.id_akun, accessToken);
        review.userName = user.nama;
        review.foto = user.foto;
      }
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      print("huh");
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> countReview(int id, {int? limit}) async {
    _isLoading = true;
    notifyListeners();

    try {
      _reviewCount = await _reviewService.countReview(id, limit: limit);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setRating(int rating) {
    _rating = rating;
    notifyListeners();
  }

  Future<bool> addReview(int id_akun, int id_destinasiwisata ,String reviewText) async {
    print("masuk");
    _isLoading = true;
    notifyListeners();

    print(id_akun);
    print(id_destinasiwisata);

    try {
      return await _reviewService.addReview(
          id_akun, id_destinasiwisata, _rating, reviewText);
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
