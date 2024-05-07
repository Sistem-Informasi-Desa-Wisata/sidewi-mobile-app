import 'dart:io';
import 'package:http/http.dart' as http;

class RegisterRequestModel {
  final String nama;
  final String email;
  final String password;
  final File? foto;

  RegisterRequestModel(
      {required this.nama,
      required this.email,
      required this.password,
      required this.foto});

  Map<String, dynamic> toJson() {
    return {
      'username': nama,
      'email': email,
      'password': password,
      'foto': foto,
    };
  }
}
