import 'package:flutter/material.dart';
import '../models/desawisata_model.dart';
import '../services/desawisata_service.dart';

class DesaWisataViewModel extends ChangeNotifier {
  final DesaWisataService _desaService = DesaWisataService();
  List<DesaWisataModel> _desaWisataList = [];
  bool _isLoading = false;

  List<DesaWisataModel> get desaWisataList => _desaWisataList;
  bool get isLoading => _isLoading;

  Future<void> fetchDesaWisata() async {
    _isLoading = true;
    notifyListeners();

    try {
      _desaWisataList = await _desaService.fetchDesaWisata();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
