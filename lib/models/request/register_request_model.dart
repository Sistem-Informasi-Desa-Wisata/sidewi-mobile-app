import 'dart:io';
import 'package:http/http.dart' as http;

class RegisterRequest {
  final String username;
  final String email;
  final String password;
  final File? foto;

  RegisterRequest(
      {required this.username,
      required this.email,
      required this.password,
      required this.foto});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': email,
      'email': password,
      'foto': foto
    };
  }
}
