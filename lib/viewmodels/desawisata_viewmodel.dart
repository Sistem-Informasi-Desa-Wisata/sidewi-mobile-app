import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/informasidesawisata_model.dart';
import 'package:sidewi_mobile_app/services/desawisata_service.dart';
import 'package:sidewi_mobile_app/services/desafavorit_service.dart';
import 'package:sidewi_mobile_app/services/notifikasi_service.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/models/desafavorit_model.dart';

class DesaWisataViewModel extends ChangeNotifier {
  final DesaWisataService _desaWisataService = DesaWisataService();
  final DesaFavoritService _desaFavoritService = DesaFavoritService();
  final NotifikasiService _notifikasiService = NotifikasiService();

  List<DesaWisataModel> _desaWisataList = [];
  List<DesaWisataModel> _desaWisataSearchList = [];
  List<DesaWisataModel> _desaWisataRandomList = [];
  List<DesaWisataModel> _desaWisataRintisanList = [];
  List<DesaWisataModel> _desaWisataBerkembangList = [];
  List<DesaWisataModel> _desaWisataMajuList = [];
  List<DesaWisataModel> _desaWisataMandiriList = [];
  List<DesaWisataModel> _favoritDesaList = [];
  DesaWisataModel? _desaWisataDetail;
  InformasiDesaWisataModel? _informasiDesaWisata;
  bool _isLoading = false;
  String? _errorMessage;

  DesaWisataModel? get desaWisataDetail => _desaWisataDetail;
  InformasiDesaWisataModel? get informasiDesaWisata => _informasiDesaWisata;

  List<DesaWisataModel> get desaWisataList => _desaWisataList;
  List<DesaWisataModel> get desaWisataSearchList => _desaWisataSearchList;
  List<DesaWisataModel> get desaWisataRandomList => _desaWisataRandomList;
  List<DesaWisataModel> get desaWisataRintisanList => _desaWisataRintisanList;
  List<DesaWisataModel> get desaWisataBerkembangList =>
      _desaWisataBerkembangList;
  List<DesaWisataModel> get desaWisataMajuList => _desaWisataMajuList;
  List<DesaWisataModel> get desaWisataMandiriList => _desaWisataMandiriList;
  List<DesaWisataModel> get favoritDesaList => _favoritDesaList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDesaWisata(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _desaWisataList = await _desaWisataService.fetchDesaWisata();
      await fetchIsFavoriter(userId, _desaWisataList, null);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDesaWisataBySearch(String search, int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      List<DesaWisataModel> allDesaWisata =
          await _desaWisataService.fetchDesaWisata();

      if (search.isNotEmpty) {
        _desaWisataSearchList = allDesaWisata.where((desa) {
          final namaMatches =
              desa.nama.toLowerCase().contains(search.toLowerCase());
          final kabupatenMatches =
              desa.kabupaten.toLowerCase().contains(search.toLowerCase());
          return namaMatches || kabupatenMatches;
        }).toList();
      } else {
        _desaWisataSearchList = allDesaWisata;
      }
      await fetchIsFavoriter(userId, _desaWisataSearchList, null);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRandomDesaWisata(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      List<DesaWisataModel> allDesaWisata =
          await _desaWisataService.fetchDesaWisata();
      allDesaWisata.shuffle();
      _desaWisataRandomList = allDesaWisata;
      await fetchIsFavoriter(userId, _desaWisataRandomList, null);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDesaWisataByKategori(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      print("fetching DesaWisataByKategori");
      List<DesaWisataModel> allDesaWisata =
          await _desaWisataService.fetchDesaWisata();

      _desaWisataRintisanList = [];
      _desaWisataBerkembangList = [];
      _desaWisataMajuList = [];
      _desaWisataMandiriList = [];

      for (var desa in allDesaWisata) {
        if (desa.kategori == "Rintisan") {
          _desaWisataRintisanList.add(desa);
        } else if (desa.kategori == "Berkembang") {
          _desaWisataBerkembangList.add(desa);
        } else if (desa.kategori == "Maju") {
          _desaWisataMajuList.add(desa);
        } else if (desa.kategori == "Mandiri") {
          _desaWisataMandiriList.add(desa);
        }
      }
      await fetchIsFavoriter(userId, _desaWisataRintisanList, null);
      await fetchIsFavoriter(userId, _desaWisataBerkembangList, null);
      await fetchIsFavoriter(userId, _desaWisataMajuList, null);
      await fetchIsFavoriter(userId, _desaWisataMandiriList, null);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDetailDesaWisata(int id, int userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      print("vm: processing");
      _desaWisataDetail = await _desaWisataService.fetchDetailDesaWisata(id);
      _informasiDesaWisata =
          await _desaWisataService.fetchInformasiDesaWisata(id);
      await fetchIsFavoriter(userId, null, _desaWisataDetail);

      print("vm: ${_desaWisataDetail}");
    } catch (e) {
      _errorMessage = 'Failed to load data';
      print("error fetching informasi: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDesaFavoritUser(int userId) async {
    try {
      List<DesaFavoritModel> favoriteDesaIds =
          await _desaFavoritService.fetchDesaFavoritUser(userId);
      List<DesaWisataModel> desas = [];
      for (var favorite in favoriteDesaIds) {
        DesaWisataModel desa = await _desaWisataService
            .fetchDetailDesaWisata(favorite.id_desawisata);
        desas.add(desa);
      }
      _favoritDesaList = desas;
      await fetchIsFavoriter(userId, _favoritDesaList, null);
      notifyListeners();
    } catch (e) {
      print("Error fetching favorite Desas: $e");
    }
  }

  Future<void> fetchIsFavoriter(
      int userId, List<DesaWisataModel>? list, DesaWisataModel? desa) async {
    try {
      List<DesaFavoritModel> favoriteDesaIds =
          await _desaFavoritService.fetchDesaFavoritUser(userId);

      Set<int> favoriteDesaIdSet =
          favoriteDesaIds.map((fav) => fav.id_desawisata).toSet();

      updateFavorites(favoriteDesaIdSet, list, desa);

      notifyListeners();
    } catch (e) {
      print("Error fetching favorite Desas: $e");
    }
  }

  void updateFavorites(Set<int> favoriteDesaIdSet, List<DesaWisataModel>? list,
      DesaWisataModel? desa) {
    if (list != null) {
      for (var item in list) {
        if (favoriteDesaIdSet.contains(item.id)) {
          item.isFavorite = true;
        } else {
          item.isFavorite = false;
        }
      }
    }
    if (desa != null) {
      if (favoriteDesaIdSet.contains(desa.id)) {
        desa.isFavorite = true;
      } else {
        desa.isFavorite = false;
      }
    }
  }

  Future<void> toggleFavoriteStatus(DesaWisataModel desa, int userId) async {
    try {
      if (desa.isFavorite) {
        List<DesaFavoritModel> favoriteDesaIds =
            await _desaFavoritService.fetchDesaFavoritUser(userId);
        List<DesaWisataModel> desas = [];

        for (var favorite in favoriteDesaIds) {
          DesaWisataModel desa = await _desaWisataService
              .fetchDetailDesaWisata(favorite.id_desawisata);
          desas.add(desa);
        }
        DesaFavoritModel? desaFavorit;
        try {
          desaFavorit = favoriteDesaIds.firstWhere(
            (favorit) =>
                favorit.id_desawisata == desa.id && favorit.id_akun == userId,
          );
        } catch (e) {
          desaFavorit = null;
        }

        if (desaFavorit != null) {
          await _desaFavoritService.removeFavorite(desaFavorit.id);
        }
      } else {
        await _desaFavoritService.addFavorite(userId, desa.id);
        await _notifikasiService.addNotifikasi(
            userId, "Anda mulai menyukai desa ${desa.nama}!");
      }
      await fetchIsFavoriter(userId, null, desa);
      notifyListeners();
    } catch (e) {
      print("Error toggling favorite status: $e");
    }
  }
}
