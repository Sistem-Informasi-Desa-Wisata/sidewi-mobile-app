import 'package:flutter/material.dart';
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
      _desaWisataDetail = await DesaWisataService.fetchDetailDesaWisata(id);
    } catch (e) {
      _errorMessage = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
