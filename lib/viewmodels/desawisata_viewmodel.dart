import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/informasi_desawisata_model.dart';
import '../models/desawisata_model.dart';
import '../services/desawisata_service.dart';

class DesaWisataViewModel extends ChangeNotifier {
  final DesaWisataService _desaWisataService = DesaWisataService();
  List<DesaWisataModel> _desaWisataList = [];
  DesaWisataModel? _desaWisataDetail;
  bool _isLoading = false;
  String? _errorMessage;

  DesaWisataModel? get desaWisataDetail => _desaWisataDetail;
  List<DesaWisataModel> get desaWisataList => _desaWisataList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final DesaWisataService _informasiDesaWisataService = DesaWisataService();
  List<InformasiDesaWisataModel> _informasidesaWisataList = [];
  InformasiDesaWisataModel? _informasiDesaWisata;
  bool _isLoadingInformasi = false;
  String? _errorMessageInformasi;

  InformasiDesaWisataModel? get informasiDesaWisata => _informasiDesaWisata;
  List<InformasiDesaWisataModel> get informasiDesaWisataList =>
      _informasidesaWisataList;
  bool get isLoadingInformasi => _isLoadingInformasi;
  String? get errorMessageInformasi => _errorMessageInformasi;

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

  Future<void> fetchDetailDesaWisata(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      print("vm: processing");
      _desaWisataDetail = await _desaWisataService.fetchDetailDesaWisata(id);
    } catch (e) {
      _errorMessage = 'Failed to load data';
      print("error fetching informasi: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchInformasiDesaWisata(int id) async {
    _isLoadingInformasi = true;
    _errorMessageInformasi = null;
    notifyListeners();
    try {
      print("vm: processing");
      _informasiDesaWisata =
          await _informasiDesaWisataService.fetchInformasiDesaWisata(id);
      print("vm ${_informasiDesaWisata}");
    } catch (e) {
      _errorMessageInformasi = 'Failed to load data';
      print("error fetching informasi: $e");
    } finally {
      _isLoadingInformasi = false;
      notifyListeners();
    }
  }
}
