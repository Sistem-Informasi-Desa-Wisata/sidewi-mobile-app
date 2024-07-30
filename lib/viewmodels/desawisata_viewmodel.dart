import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/informasidesawisata_model.dart';
import 'package:sidewi_mobile_app/services/desawisata_service.dart';
import 'package:sidewi_mobile_app/services/desafavorit_service.dart';
import 'package:sidewi_mobile_app/models/desawisata_model.dart';
import 'package:sidewi_mobile_app/models/desafavorit_model.dart';

class DesaWisataViewModel extends ChangeNotifier {
  final DesaWisataService _desaWisataService = DesaWisataService();
  final DesaFavoritService _desaFavoritService = DesaFavoritService();

  List<DesaWisataModel> _desaWisataList = [];
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
  List<DesaWisataModel> get desaWisataRandomList => _desaWisataRandomList;
  List<DesaWisataModel> get desaWisataRintisanList => _desaWisataRintisanList;
  List<DesaWisataModel> get desaWisataBerkembangList =>
      _desaWisataBerkembangList;
  List<DesaWisataModel> get desaWisataMajuList => _desaWisataMajuList;
  List<DesaWisataModel> get desaWisataMandiriList => _desaWisataMandiriList;
  List<DesaWisataModel> get favoritDesaList => _favoritDesaList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDesaWisata() async {
    _isLoading = true;
    notifyListeners();

    try {
      _desaWisataList = await _desaWisataService.fetchDesaWisata();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRandomDesaWisata() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<DesaWisataModel> allDesaWisata =
          await _desaWisataService.fetchDesaWisata();
      allDesaWisata.shuffle();
      _desaWisataRandomList = allDesaWisata;
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDesaWisataByKategori() async {
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
      print(_desaWisataRintisanList);
      print(_desaWisataBerkembangList);
      print(_desaWisataMajuList);
      print(_desaWisataMandiriList);
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDetailDesaWisata(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      print("vm: processing");
      _desaWisataDetail = await _desaWisataService.fetchDetailDesaWisata(id);
      _informasiDesaWisata =
          await _desaWisataService.fetchInformasiDesaWisata(id);
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
      notifyListeners();
    } catch (e) {
      print("Error fetching favorite Desas: $e");
    }
  }
}
