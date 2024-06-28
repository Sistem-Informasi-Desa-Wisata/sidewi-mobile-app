import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/request/login_request_model.dart';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/request/logout_request_model.dart';
import 'package:sidewi_mobile_app/models/response/login_response_model.dart';
import 'package:sidewi_mobile_app/models/response/logout_response_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';
import 'package:sidewi_mobile_app/services/auth_service.dart';
import 'package:sidewi_mobile_app/provider/storage_provider.dart';

// melakukan http request ke API

class ApiService {
 
  // Register
  Future<RegisterResponse> register(RegisterRequest request) async {
    final url = Uri.parse('${ApiConfig.baseUrl}akun/add');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal tersambung ke API. Kode: ${response.statusCode}');
    }
  }

  // Login

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await http.post(
      Uri.parse('${ApiConfig.baseUrl}akun/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    print('Response status code: ${response.statusCode}');
    print('Response content-type: ${response.headers['content-type']}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Pastikan content-type adalah application/json

      try {
        // Parsing JSON dari response body
        final jsonResponse = jsonDecode(response.body);
        await saveLoginData(jsonResponse);
        readJwtToken();
        return LoginResponse.fromJson(jsonResponse);
      } catch (e) {
        throw Exception('Failed to parse JSON: $e');
      }
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }

  Future<LogoutResponse> logout() async {
    try {
      String? token = await getLoginData();
      print("Ini token = ${token}");
      if (token != null) {
        final response = await http.delete(
          Uri.parse('${ApiConfig.baseUrl}akun/logout'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({'accessToken': token}),
        );

        if (response.statusCode == 200) {
          await deleteLoginData(); 
          return LogoutResponse(success: true);
        } else {
          throw Exception('Failed to logout: ${response.statusCode}');
        }
      } else {
        throw Exception('Token not found, cannot logout');
      }
    } catch (e) {
      print('Error during logout: $e');
      throw Exception('Failed to logout: $e');
    }
  }

  Future<String?> getToken() async {
    // Mendapatkan token untuk digunakan dalam pemanggilan API
    return await getLoginData();
  }
}
