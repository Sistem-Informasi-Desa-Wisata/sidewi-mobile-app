import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sidewi_mobile_app/models/response/desawisata_response_model.dart';
import 'package:sidewi_mobile_app/services/auth_service.dart';

class DesaProvider with ChangeNotifier {
  List<DesaWisata> _desaList = [];
  bool _isLoading = false;

  List<DesaWisata> get desaList => _desaList;
  bool get isLoading => _isLoading;

  Future<void> fetchDesa() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response =
          await http.get(Uri.parse('${ApiConfig.baseUrl}desawisata'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _desaList = data.map((json) => DesaWisata.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }
}
