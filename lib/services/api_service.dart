import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';
import 'package:sidewi_mobile_app/services/auth_service.dart';

// melakukan http request ke API

class ApiService {
  Future<RegisterResponse> register(RegisterRequest request) async {
    final url = Uri.parse('${ApiConfig.baseUrl}akun/register');
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
      throw Exception('Tidak tersambung ke API');
    }
  }
}
