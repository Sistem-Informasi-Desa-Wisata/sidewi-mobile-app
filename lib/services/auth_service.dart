import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';

class APIService {
  static const String baseURL = 'http://localhost:3000/akun';

  Future<RegisterResponseModel> register(
      RegisterRequestModel requestModel) async {
    final response = await http.post(
      Uri.parse('$baseURL/add'),
      body: jsonEncode(requestModel.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }
}
