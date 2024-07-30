import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sidewi_mobile_app/models/destinasifavorit_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class DestinasiFavoritService {
  Future<List<DestinasiFavoritModel>> fetchDesaFavorit() async {
    final response =
        await http.post(Uri.parse('${ApiConfig.baseUrl}/destinasifavorit'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DestinasiFavoritModel> desaFavoritList = body
          .map((dynamic item) => DestinasiFavoritModel.fromJson(item))
          .toList();
      return desaFavoritList;
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }

  Future<List<DestinasiFavoritModel>> fetchDestinasiFavoritUser(
      int id_akun) async {
    final response = await http
        .get(Uri.parse('${ApiConfig.baseUrl}/destinasifavorit/akun/$id_akun'));
    print("service ${response.body}");
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DestinasiFavoritModel> destinasiFavoritList = body
          .map((dynamic item) => DestinasiFavoritModel.fromJson(item))
          .toList();
      return destinasiFavoritList;
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }

  Future<void> addFavorite(int userId, int destinasiId) async {
    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/destinasifavorit/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id_akun': userId,
        'id_destinasiwisata': destinasiId,
      }),
    );
    if (response.statusCode == 200) {
      print("berhasil menambahkan favorite destinasi $destinasiId");
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }

  Future<void> removeFavorite(int idFavorit) async {
    final response = await http.delete(
      Uri.parse('${ApiConfig.baseUrl}/destinasifavorit/$idFavorit'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print("berhasil menghapus favorite $idFavorit");
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }
}
