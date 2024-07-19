import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/models/kategoridestinasi_model.dart';
import 'package:sidewi_mobile_app/services/destinasiwisata_service.dart'; // Update with your actual path

class DestinasiWisataViewModel extends ChangeNotifier {
  final DestinasiWisataService _destinasiwisataService =
      DestinasiWisataService();
  List<DestinasiWisataModel> _destinasiwisataList = [];
  List<DestinasiWisataModel> _destinasiwisataByDesaList = [];
  DestinasiWisataModel? _selectedDestinasiWisata;
  KategoriDestinasiModel? _kategori;
  bool _isLoading = true;
  String _errorMessage = '';

  List<DestinasiWisataModel> get destinasiwisataList => _destinasiwisataList;
  List<DestinasiWisataModel> get destinasiwisataByDesaList =>
      _destinasiwisataByDesaList;
  DestinasiWisataModel? get selectedDestinasiWisata => _selectedDestinasiWisata;
  KategoriDestinasiModel? get kategori => _kategori;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

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

  Future<void> fetchDestinasiWisataByIdDesa(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _destinasiwisataByDesaList =
          await _destinasiwisataService.fetchDestinasiWisataByIdDesa(id);
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
}
