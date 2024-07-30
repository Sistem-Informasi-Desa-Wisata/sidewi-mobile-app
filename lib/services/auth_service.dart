import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';
import 'package:mime/mime.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

class AuthService {
  Future<void> register(Map<String, dynamic> userData, File? foto) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}/akun/add');
    final request = http.MultipartRequest('POST', uri);

    userData.forEach((key, value) {
      request.fields[key] = value;
    });


    if (foto != null) {
      final mimeTypeData = lookupMimeType(foto.path)!.split('/');
      final file = await http.MultipartFile.fromPath(
        'foto',
        foto.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
      );
      print(foto.path);
      request.files.add(file);
    }

    final response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to register');
    }
  }

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/akun/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return response.body.replaceAll('"', '');
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }

  Future<void> logout(String accessToken) async {
    final response = await http.delete(
      Uri.parse('${ApiConfig.baseUrl}/akun/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, String>{
        'accessToken': accessToken,
      }),
    );

    if (response.statusCode == 200) {
      // Logout berhasil
    } else {
      throw Exception('Failed to logout');
    }
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid JWT token');
    }

    String decodedPayload =
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
    Map<String, dynamic> payloadMap = jsonDecode(decodedPayload);
    print('Payload JWT Token: $payloadMap');
    return json.decode(decodedPayload);
  }

  Future<bool> isEmailRegistered(String email) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/akun'),
      );

      if (response.statusCode == 200) {
        final List users = jsonDecode(response.body);
        for (var user in users) {
          if (user['email'] == email) {
            return true;
          }
        }
        return false;
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
