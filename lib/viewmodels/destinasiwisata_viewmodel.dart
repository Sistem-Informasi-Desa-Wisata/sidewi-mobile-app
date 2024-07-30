import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/models/destinasifavorit_model.dart';
import 'package:sidewi_mobile_app/models/kategoridestinasi_model.dart';
import 'package:sidewi_mobile_app/models/review_model.dart';
import 'package:sidewi_mobile_app/services/destinasiwisata_service.dart'; // Update with your actual path
import 'package:sidewi_mobile_app/services/destinasifavorit_service.dart'; // Update with your actual path
import 'package:sidewi_mobile_app/services/review_service.dart'; // Update with your actual path

class DestinasiWisataViewModel extends ChangeNotifier {
  final DestinasiWisataService _destinasiwisataService =
      DestinasiWisataService();
  final ReviewService _reviewService = ReviewService();
  final DestinasiFavoritService _destinasifavoritService =
      DestinasiFavoritService();

  List<DestinasiWisataModel> _destinasiwisataList = [];
  List<DestinasiWisataModel> _destinasiwisataByDesaList = [];
  List<DestinasiWisataModel> _favoritDestinasiList = [];
  DestinasiWisataModel? _selectedDestinasiWisata;
  KategoriDestinasiModel? _kategori;
  bool _isLoading = true;
  String? _errorMessage = '';
  double? _averageRating = 0.0;

  List<DestinasiWisataModel> get destinasiwisataList => _destinasiwisataList;
  List<DestinasiWisataModel> get destinasiwisataByDesaList =>
      _destinasiwisataByDesaList;
  List<DestinasiWisataModel> get favoritDestinasiList => _favoritDestinasiList;

  DestinasiWisataModel? get selectedDestinasiWisata => _selectedDestinasiWisata;
  KategoriDestinasiModel? get kategori => _kategori;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  double? get averageRating => _averageRating;

  Future<void> fetchDestinasiWisataList() async {
    _isLoading = true;
    notifyListeners();

    try {
      _destinasiwisataList =
          await _destinasiwisataService.fetchDestinasiWisataList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDestinasiWisataByIdDesa(int id,int userId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _destinasiwisataByDesaList =
          await _destinasiwisataService.fetchDestinasiWisataByIdDesa(id);
      fetchIsFavoriter(userId, _destinasiwisataByDesaList, null);
      print(_destinasiwisataByDesaList);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      print(_errorMessage);
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDestinasiWisataById(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedDestinasiWisata =
          await _destinasiwisataService.fetchDestinasiWisataById(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> getCategoryName(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _kategori = await _destinasiwisataService.getCategoryName(id);
      return _kategori?.nama;
    } catch (e) {
      _errorMessage = e.toString();
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<double?> fetchAndCalculateAverageRating(int destinasiId) async {
    print(
        "fetchAndCalculateAverageRating called with destinasiId: $destinasiId");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      List<ReviewModel> reviews =
          await _reviewService.fetchReviewByIdDestinasi(destinasiId);
      if (reviews.isEmpty) {
        print("No reviews found for destinasiId: $destinasiId");
        return null; // Return null if no reviews are found
      } else {
        int totalRating = reviews.fold(0, (sum, review) => sum + review.rating);
        print("Total rating: $totalRating for destinasiId: $destinasiId");
        double averageRating = totalRating / reviews.length;
        double roundedAverageRating =
            double.parse(averageRating.toStringAsFixed(2));
        print("Average rating: $averageRating for destinasiId: $destinasiId");
        _averageRating = roundedAverageRating;
        return roundedAverageRating;
      }
    } catch (e) {
      print("Error in fetchAndCalculateAverageRating: $e");
      _errorMessage = 'Failed to calculate average rating: $e';
      throw Exception('Failed to calculate average rating: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDestinasiFavoritUser(int userId) async {
    try {
      List<DestinasiFavoritModel> favoriteDestinasiIds =
          await _destinasifavoritService.fetchDestinasiFavoritUser(userId);
      List<DestinasiWisataModel> destinasilist = [];
      for (var favorite in favoriteDestinasiIds) {
        try {
          DestinasiWisataModel? destinasi = await _destinasiwisataService
              .fetchDestinasiWisataById(favorite.id_destinasiwisata);
          destinasilist.add(destinasi);
        } catch (e) {
          print(
              "Error fetching DestinasiWisataModel for id ${favorite.id_destinasiwisata}: $e");
        }
      }
      _favoritDestinasiList = destinasilist;
      fetchIsFavoriter(userId, _favoritDestinasiList, null);
      notifyListeners();
    } catch (e) {
      print("Error fetching favorite DestinasiFavoritUser: $e");
    }
  }

  Future<void> fetchIsFavoriter(int userId, List<DestinasiWisataModel>? list,
      DestinasiWisataModel? destinasi) async {
    try {
      List<DestinasiFavoritModel> favoriteDestinasiIds =
          await _destinasifavoritService.fetchDestinasiFavoritUser(userId);

      Set<int> favoriteDestinasiIdSet =
          favoriteDestinasiIds.map((fav) => fav.id_destinasiwisata).toSet();

      updateFavorites(favoriteDestinasiIdSet, list, destinasi);

      notifyListeners();
    } catch (e) {
      print("Error fetching favorite destinasi: $e");
    }
  }

  void updateFavorites(Set<int> favoriteDestinasiIdSet,
      List<DestinasiWisataModel>? list, DestinasiWisataModel? destinasi) {
    if (list != null) {
      for (var item in list) {
        if (favoriteDestinasiIdSet.contains(item.id)) {
          item.isFavorite = true;
        } else {
          item.isFavorite = false;
        }
      }
    }
    if (destinasi != null) {
      if (favoriteDestinasiIdSet.contains(destinasi.id)) {
        destinasi.isFavorite = true;
      } else {
        destinasi.isFavorite = false;
      }
    }
  }

  Future<void> toggleFavoriteStatus(
      DestinasiWisataModel destinasi, int userId) async {
    try {
      if (destinasi.isFavorite) {
        List<DestinasiFavoritModel> favoriteDestinasiIds =
            await _destinasifavoritService.fetchDestinasiFavoritUser(userId);
        List<DestinasiWisataModel> destinasis = [];

        for (var favorite in favoriteDestinasiIds) {
          DestinasiWisataModel destinasi = await _destinasiwisataService
              .fetchDestinasiWisataById(favorite.id_destinasiwisata);
          destinasis.add(destinasi);
        }
        DestinasiFavoritModel? destinasiFavorit;
        try {
          destinasiFavorit = favoriteDestinasiIds.firstWhere(
            (favorit) =>
                favorit.id_destinasiwisata == destinasi.id &&
                favorit.id_akun == userId,
          );
        } catch (e) {
          destinasiFavorit = null;
        }

        if (destinasiFavorit != null) {
          await _destinasifavoritService.removeFavorite(destinasiFavorit.id);
        }
      } else {
        await _destinasifavoritService.addFavorite(userId, destinasi.id);
      }
      await fetchIsFavoriter(userId, null, destinasi);
      notifyListeners();
    } catch (e) {
      print("Error toggling favorite status: $e");
    }
  }
}
