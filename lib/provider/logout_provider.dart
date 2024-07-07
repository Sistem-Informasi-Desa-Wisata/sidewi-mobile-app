import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/request/logout_request_model.dart';
import 'package:sidewi_mobile_app/provider/storage_provider.dart';
import 'package:sidewi_mobile_app/repository/user_repository.dart';

// Satate management login
//  Data dari UI ke Repository

class LogoutProvider with ChangeNotifier {
  final UserRepository userRepository;

  LogoutProvider(this.userRepository);

  bool _isLoading = false;
  String? _token;
  String? _errorMessage;
  String? _successMessage;
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
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

  Future<void> logout(token) async {
    _setToken(await getLoginData());
    _setLoading(true);
    _setErrorMessage(null);


    try {
      await userRepository.logout();
      _setSuccess(true);
      _successMessage = "Logout berhasil!";
    } catch (error) {
      _setSuccess(false);
      _successMessage = "Logout gagal!";
      _setErrorMessage('Failed to logout: $error');
    } finally {
      _setLoading(false);
    }
  }
}
