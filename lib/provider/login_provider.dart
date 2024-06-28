import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/request/login_request_model.dart';
import 'package:sidewi_mobile_app/repository/user_repository.dart';

// Satate management login
//  Data dari UI ke Repository

class LoginProvider with ChangeNotifier {
  final UserRepository userRepository;

  LoginProvider(this.userRepository);

  bool _isLoading = false;
  String? _token;
  String? _errorMessage;
  String? _successMessage;
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
  String? get token => _token;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setToken(String? value) {
    _token = value;
    notifyListeners();
  }

  void _setErrorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  void _setSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _setLoading(true);
    _setErrorMessage(null);

    final request = LoginRequest(email: email, password: password);

    try {
      final response = await userRepository.login(request);
      _setToken(response.accessToken);
      _setSuccess(true);
      _successMessage = "Login berhasil!";
    } catch (error) {
      _setSuccess(false);
      _successMessage = "Login gagal!";
      _setErrorMessage('Failed to login: $error');
    } finally {
      _setLoading(false);
    }
  }
}
