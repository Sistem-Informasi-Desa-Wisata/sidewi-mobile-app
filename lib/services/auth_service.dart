import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'your_api_base_url';

  Future<bool> register(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        body: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return true; // Registrasi berhasil
      } else {
        print('Registration failed. Error: ${response.statusCode}');
        return false; // Registrasi gagal
      }
    } catch (e) {
      print('Error during registration: $e');
      return false; // Terjadi kesalahan
    }
  }
}
