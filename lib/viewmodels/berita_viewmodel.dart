import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/berita_model.dart';
import 'package:sidewi_mobile_app/services/berita_service.dart'; // Update with your actual path

class BeritaViewModel extends ChangeNotifier {
  final BeritaService _beritaService = BeritaService();
  List<BeritaModel> _beritaList = [];
  List<BeritaModel> _beritaByDesaList = [];
  BeritaModel? _selectedBerita;
  bool _isLoading = true;
  String _errorMessage = '';

  List<BeritaModel> get beritaList => _beritaList;
  List<BeritaModel> get beritaByDesaList => _beritaByDesaList;
  BeritaModel? get selectedBerita => _selectedBerita;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchBeritaList() async {
    _isLoading = true;
    notifyListeners();

    try {
      _beritaList = await _beritaService.fetchBeritaList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchBeritaByIdDesa(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _beritaByDesaList = await _beritaService.fetchBeritaByIdDesa(id);
      print(_beritaByDesaList);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchBeritaById(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedBerita = await _beritaService.fetchBeritaById(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
