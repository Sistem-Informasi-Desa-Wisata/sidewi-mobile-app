import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../services/api_config.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class UserService {
  Future<List<UserModel>> getAllUsers() async {
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/akun/all'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => UserModel.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }

  Future<UserModel> fetchUserById(int id, String? accessToken) async {
    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/akun/$id'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      print(UserModel.fromJson(jsonDecode(response.body)));
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> updateUser({
    required int id,
    required String nama,
    required String no_telp,
    String? email,
    String? password,
    String? fotoPath,
    required String accessToken,
  }) async {
    var request = http.MultipartRequest(
      'PATCH',
      Uri.parse('${ApiConfig.baseUrl}/akun/$id'),
    );

    request.fields['nama'] = nama;
    request.fields['no_telp'] = no_telp;
    if (email != null) {
      request.fields['email'] = email;
    }
    if (password != null) {
      request.fields['password'] = password;
    }

    if (fotoPath != null) {
      final mimeTypeData = lookupMimeType(fotoPath)!.split('/');
      final file = await http.MultipartFile.fromPath(
        'foto',
        fotoPath,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );
      request.files.add(file);
    }

    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer $accessToken',
    });

    var response = await request.send();

    if (response.statusCode == 200) {
      print('User updated successfully');
    } else {
      throw Exception('Failed to update user');
    }
  }
}
