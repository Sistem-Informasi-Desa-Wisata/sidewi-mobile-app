import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sidewi_mobile_app/models/desafavorit_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class DesaFavoritService {
  Future<List<DesaFavoritModel>> fetchDesaFavorit() async {
    final response =
        await http.post(Uri.parse('${ApiConfig.baseUrl}/desafavorit'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DesaFavoritModel> desaFavoritList =
          body.map((dynamic item) => DesaFavoritModel.fromJson(item)).toList();
      return desaFavoritList;
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }

  Future<List<DesaFavoritModel>> fetchDesaFavoritUser(int id_akun) async {
    final response = await http
        .get(Uri.parse('${ApiConfig.baseUrl}/desafavorit/akun/$id_akun'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DesaFavoritModel> desaFavoritList =
          body.map((dynamic item) => DesaFavoritModel.fromJson(item)).toList();
      return desaFavoritList;
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }
}
