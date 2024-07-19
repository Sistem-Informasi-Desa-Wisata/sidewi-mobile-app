import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/produk_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart'; // Update with your actual path

class ProdukService {
  final String baseUrl = ApiConfig.baseUrl;
  Future<List<ProdukModel>> fetchProdukList() async {
    final response = await http.get(Uri.parse('$baseUrl/produk'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ProdukModel> produkList =
          body.map((dynamic item) => ProdukModel.fromJson(item)).toList();
      return produkList;
    } else {
      throw Exception('Failed to load produk');
    }
  }

  Future<List<ProdukModel>> fetchProdukByIdDesa(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/produk/desa/$id'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ProdukModel> produkList =
          body.map((dynamic item) => ProdukModel.fromJson(item)).toList();
      return produkList;
    } else {
      throw Exception('Failed to load produk');
    }
  }
  Future<ProdukModel> fetchProdukById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/produk/$id'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return ProdukModel.fromJson(body);
    } else {
      throw Exception('Failed to load produk');
    }
  }
}
