import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/informasidesawisata_model.dart';
import '../services/api_config.dart';

class InformasiDesaWisataService {
  Future<InformasiDesaWisataModel> fetchInformasiDesaWisata(int id) async {
    final response =
        await http.get(Uri.parse('${ApiConfig.baseUrl}/informasi/desa/$id'));
    print("response InformasiDesaWisataModel: ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return InformasiDesaWisataModel.fromJson(body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
