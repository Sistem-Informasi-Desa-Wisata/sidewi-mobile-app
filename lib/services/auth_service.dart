<<<<<<< Updated upstream
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';

class APIService {
  static const String baseURL = 'http://192.168.87.109:3000/akun';

  Future<RegisterResponseModel> register(
      RegisterRequestModel requestModel) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseURL/add'));
    request.fields['nama'] = requestModel.nama;
    request.fields['email'] = requestModel.email;
    request.fields['password'] = requestModel.password;

    var fotoFile =
        await http.MultipartFile.fromPath('foto', requestModel.foto!.path);
    request.files.add(fotoFile);

    // Mengirim request dan mendapatkan response
    var response = await request.send();
    if (response.statusCode == 200) {
      // Jika berhasil, membaca response body dan mengonversinya menjadi JSON
      var responseBody = await response.stream.bytesToString();
      return RegisterResponseModel.fromJson(json.decode(responseBody));
    } else {
      // Jika gagal, melemparkan exception
      print('Error: ${response.statusCode}');
      throw Exception('Failed to register');
    }
  }
=======
class ApiConfig {
  static const String baseUrl = 'http://10.0.2.2:3000/';
>>>>>>> Stashed changes
}
