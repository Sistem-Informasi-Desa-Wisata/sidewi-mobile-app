import 'package:flutter/material.dart';
import '../models/informasidesawisata_model.dart';
import '../services/informasidesawisata_service.dart';

class InformasiDesaWisataViewModel extends ChangeNotifier {
  final InformasiDesaWisataService _informasiDesaWisataService = InformasiDesaWisataService();
  InformasiDesaWisataModel? _informasiDesaWisata;
  bool _isLoading = false;
  String? _errorMessage;

  InformasiDesaWisataModel? get informasiDesaWisata => _informasiDesaWisata;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchInformasiDesaWisata(int id) async {
    _isLoading = true;
    _errorMessage = null;
    try {
      print("vm: processing");
      _informasiDesaWisata = await _informasiDesaWisataService.fetchInformasiDesaWisata(id);
      print("vm ${_informasiDesaWisata}");
    } catch (e) {
      _errorMessage = 'Failed to load data';
    } finally {
      _isLoading = false;
    }
  }
}
