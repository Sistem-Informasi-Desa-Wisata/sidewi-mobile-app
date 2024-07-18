import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';
import 'dart:io';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();
  UserModel? _user;
  bool _loading = false;
  String? _errorMessage;
  String? _accessToken;
  String? _successMessage;
  bool _isSuccess = false;
  List<UserModel> _allUsers = [];

  UserModel? get user => _user;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  String? get accessToken => _accessToken;
  String? get successMessage => _successMessage;
  List<UserModel> get allUsers => _allUsers;
  bool get isSuccess => _isSuccess;

  
  Future<bool> isEmailRegistered(String email) async {
    return await _authService.isEmailRegistered(email);
  }

  Future<void> register(Map<String, dynamic> userData, File? foto) async {
    await _authService.register(userData, foto);
  }



  Future<void> login(String email, String password) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Mendapatkan token dari service
      final String accessToken = await _authService.login(email, password);
      _accessToken = accessToken;
      print(_accessToken);
      // Memproses JWT dan menyimpan hasilnya di _user
      final decodedToken = _authService.parseJwt(accessToken);

      final int id = decodedToken['id'] ?? 0;
      final String nama = decodedToken['nama']?.toString() ?? '';
      final String userEmail = decodedToken['email']?.toString() ?? '';
      final String foto = decodedToken['foto']?.toString() ?? '';
      final String role = decodedToken['role']?.toString() ?? '';
      final String no_telp = decodedToken['no_telp']?.toString() ?? '';
      final String createdAt = decodedToken['createdAt']?.toString() ?? '';
      final String updatedAt = decodedToken['updatedAt']?.toString() ?? '';

      _user = UserModel(
        id: id,
        nama: nama,
        email: userEmail,
        foto: foto,
        role: role,
        no_telp: no_telp,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
    } catch (e) {
      _errorMessage = e.toString();
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      if (_accessToken != null) {
        await _authService.logout(_accessToken!);
      }
      print("logout success");
      _accessToken = null;
      _user = null;
      notifyListeners();
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  Future<void> fetchUserById(int id, String accessToken) async {
    _loading = true;
    notifyListeners();

    try {
      _user = await _userService.fetchUserById(id, accessToken);
    } catch (e) {
      _errorMessage = e.toString();
    }

    _loading = false;
    notifyListeners();
  }
}
