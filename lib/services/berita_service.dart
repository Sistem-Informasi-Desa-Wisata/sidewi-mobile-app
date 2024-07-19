import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/berita_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart'; // Update with your actual path

class BeritaService {
  final String baseUrl = ApiConfig.baseUrl;
  Future<List<BeritaModel>> fetchBeritaList() async {
    final response = await http.get(Uri.parse('$baseUrl/berita'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<BeritaModel> beritaList =
          body.map((dynamic item) => BeritaModel.fromJson(item)).toList();
      return beritaList;
    } else {
      throw Exception('Failed to load berita');
    }
  }

  Future<List<BeritaModel>> fetchBeritaByIdDesa(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/berita/desa/$id'));
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<BeritaModel> beritaList =
          body.map((dynamic item) => BeritaModel.fromJson(item)).toList();
      return beritaList;
    } else {
      throw Exception('Failed to load berita');
    }
  }
  Future<BeritaModel> fetchBeritaById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/berita/$id'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return BeritaModel.fromJson(body);
    } else {
      throw Exception('Failed to load berita');
    }
  }
}
