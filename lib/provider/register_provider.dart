import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/repository/user_repository.dart';

// Satate management register
//  Data dari UI ke Repository

class RegisterProvider with ChangeNotifier {
  final UserRepository userRepository;

  RegisterProvider(this.userRepository);

  bool _isLoading = false;
  String? _message;
  String? _sucsesmessage;
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
  String? get message => _message;
  bool get isSuccess => _isSuccess;

  Future<void> register(
      String nama, String no_telp, String email, String password
      //  File foto
      ) async {
    _isLoading = true;
    notifyListeners();

    final request = RegisterRequest(
        nama: nama, no_telp: no_telp, email: email, password: password
        // foto: foto
        );

    try {
      final response = await userRepository.register(request);
      _message = response.msg;
      _isSuccess = true;
      _sucsesmessage = "Registrasi berhasil!";
    } catch (e) {
      _isSuccess = false;
      _sucsesmessage = "Registrasi gagal!";
      _message = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
