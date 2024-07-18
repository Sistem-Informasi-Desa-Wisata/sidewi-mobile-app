import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/desawisata_model.dart';
import '../services/api_config.dart';

class DesaWisataService {
  Future<List<DesaWisataModel>> fetchDesaWisata() async {
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/desawisata'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DesaWisataModel> desaWisataList = body.map((dynamic item) => DesaWisataModel.fromJson(item)).toList();
      return desaWisataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
