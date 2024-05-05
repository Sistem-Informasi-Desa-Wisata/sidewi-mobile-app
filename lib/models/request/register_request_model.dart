import 'dart:io';
import 'package:http/http.dart' as http;

class RegisterRequestModel {
  final String username;
  final String email;
  final String password;
  final File foto;

  RegisterRequestModel(
      {required this.username,
      required this.email,
      required this.password,
      required this.foto});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'foto': foto,
    };
  }
}
