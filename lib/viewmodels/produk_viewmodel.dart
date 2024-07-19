import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/produk_model.dart';
import 'package:sidewi_mobile_app/services/produk_service.dart';  // Update with your actual path

class ProdukViewModel extends ChangeNotifier {
  final ProdukService _produkService = ProdukService();
  List<ProdukModel> _produkList = [];
  List<ProdukModel> _produkByDesaList = [];
  ProdukModel? _selectedProduk;
  bool _isLoading = true;
  String _errorMessage = '';

  List<ProdukModel> get produkList => _produkList;
  List<ProdukModel> get produkByDesaList => _produkByDesaList;
  ProdukModel? get selectedProduk => _selectedProduk;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProdukList() async {
    _isLoading = true;
    notifyListeners();

    try {
      _produkList = await _produkService.fetchProdukList();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  Future<void> fetchProdukByIdDesa(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _produkByDesaList = await _produkService.fetchProdukByIdDesa(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProdukById(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedProduk = await _produkService.fetchProdukById(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
