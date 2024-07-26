import 'package:http/http.dart' as http;
import 'package:sidewi_mobile_app/models/informasi_desawisata_model.dart';
import 'dart:convert';
import '../models/desawisata_model.dart';
import '../models/informasidesawisata_model.dart';
import '../services/api_config.dart';

class DesaWisataService {
  Future<List<DesaWisataModel>> fetchDesaWisata() async {
    final response =
        await http.get(Uri.parse('${ApiConfig.baseUrl}/desawisata'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<DesaWisataModel> desaWisataList =
          body.map((dynamic item) => DesaWisataModel.fromJson(item)).toList();
      return desaWisataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<DesaWisataModel> fetchDetailDesaWisata(int id) async {
    final response =
        await http.get(Uri.parse('${ApiConfig.baseUrl}/desawisata/$id'));
    print("response desawisata (service): ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return DesaWisataModel.fromJson(body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<InformasiDesaWisataModel> fetchInformasiDesaWisata(int id) async {
    final response =
        await http.get(Uri.parse('${ApiConfig.baseUrl}/informasi/desa/$id'));
<<<<<<< HEAD
    print("response InformasiDesaWisataModel: ${response.body}");
=======
    print("response InformasiDesaWisataModel (service): ${response.body}");
>>>>>>> df76beb4cd76b0708f3696db6e0bd3a79db305df
    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      return InformasiDesaWisataModel.fromJson(body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
