import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/repository/user_repository.dart';

// Satate management

class RegisterProvider with ChangeNotifier {
  final UserRepository userRepository;

  RegisterProvider(this.userRepository);

  bool _isLoading = false;
  String? _message;

  bool get isLoading => _isLoading;
  String? get message => _message;

  Future<void> register(
      String username, String password, String email, File foto) async {
    _isLoading = true;
    notifyListeners();

    final request = RegisterRequest(
        username: username, email: email, password: password, foto: foto);

    try {
      final response = await userRepository.register(request);
      _message = response.message;
    } catch (e) {
      _message = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
