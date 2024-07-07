import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';


final storage = FlutterSecureStorage();

Future<void> saveLoginData(String token) async {
  await storage.write(key: 'accessToken', value: token);
}

Future<String?> getLoginData() async {
  return await storage.read(key: 'accessToken');
}

Future<void> deleteLoginData() async {
  await storage.delete(key: 'accessToken');
}

Future<bool> checkToken() async {
  String? token = await getLoginData();
  return token != null;
}

void readJwtToken() async {
  String? jwtToken = await getLoginData();
  
  if (jwtToken != null) {
    List<String> parts = jwtToken.split('.');
    
    if (parts.length != 3) {
      throw Exception('Invalid JWT token format');
    }
    String decodedPayload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
    Map<String, dynamic> payloadMap = jsonDecode(decodedPayload);    
    print('Payload JWT Token: $payloadMap');
  } else {
    print('Token belum tersimpan');
  }
}
