import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/notifikasi_model.dart';
import 'package:sidewi_mobile_app/services/api_config.dart';

class NotifikasiService {
  final String baseUrl = ApiConfig.baseUrl;

  Future<List<NotifikasiModel>> fetchNotifikasiById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/notifikasi/akun/$id'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<NotifikasiModel> notifikasiList =
          body.map((dynamic item) => NotifikasiModel.fromJson(item)).toList();
      return notifikasiList;
    } else {
      throw Exception('Failed to load berita');
    }
  }

  Future<void> addNotifikasi(int id_akun, String deskripsi) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notifikasi/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'deskripsi': deskripsi,
        'id_akun': id_akun,
        'status': 0,
      }),
    );

    if (response.statusCode == 200) {
      print('Notifikasi berhasil ditambah');
    } else {
      print('Error Response: ${response.body}');
    }
  }
}
