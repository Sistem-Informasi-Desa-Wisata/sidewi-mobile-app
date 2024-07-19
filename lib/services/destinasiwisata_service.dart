import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/destinasiwisata_model.dart';
import 'package:sidewi_mobile_app/models/kategoridestinasi_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart'; // Update with your actual path

class DestinasiWisataService {
  final String baseUrl = ApiConfig.baseUrl;
  Future<List<DestinasiWisataModel>> fetchDestinasiWisataList() async {
    final response = await http.get(Uri.parse('$baseUrl/destinasiwisata'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DestinasiWisataModel> destinasiwisataList = body
          .map((dynamic item) => DestinasiWisataModel.fromJson(item))
          .toList();
      return destinasiwisataList;
    } else {
      throw Exception('Failed to load destinasiwisata');
    }
  }

  Future<List<DestinasiWisataModel>> fetchDestinasiWisataByIdDesa(
      int id) async {
    final response =
        await http.get(Uri.parse('$baseUrl/destinasiwisata/desa/$id'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DestinasiWisataModel> destinasiwisataList = body
          .map((dynamic item) => DestinasiWisataModel.fromJson(item))
          .toList();
      return destinasiwisataList;
    } else {
      throw Exception('Failed to load destinasiwisata');
    }
  }

  Future<DestinasiWisataModel> fetchDestinasiWisataById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/destinasiwisata/$id'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return DestinasiWisataModel.fromJson(body);
    } else {
      throw Exception('Failed to load destinasiwisata');
    }
  }

  Future<KategoriDestinasiModel> getCategoryName(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/kategoridestinasi/$id'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return KategoriDestinasiModel.fromJson(body);
    } else {
      throw Exception('Failed to load category');
    }
  }
}
