import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';
import '../services/notifikasi_service.dart';
import 'auth_viewmodel.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  String? _errorMessage;
  List<UserModel> _allUsers = [];
  final UserService _userService = UserService();
  final NotifikasiService _notifikasiService = NotifikasiService();
  final AuthViewModel _authViewModel;

  UserViewModel(this._authViewModel);

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  List<UserModel> get allUsers => _allUsers;

  Future<void> fetchAllUsers() async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _allUsers = await _userService.getAllUsers();
    } catch (e) {
      _errorMessage = e.toString();
      print('Error: $_errorMessage');
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> updateUser({
    required int id,
    required String nama,
    required String no_telp,
    required String accessToken,
    String? email,
    String? password,
    String? fotoPath,
  }) async {
    try {
      await _userService.updateUser(
          id: id,
          nama: nama,
          no_telp: no_telp,
          fotoPath: fotoPath,
          password: password,
          email: email,
          accessToken: accessToken);
      // Refresh user data after update
      await _authViewModel.fetchUserById(id, accessToken);
      await _notifikasiService.addNotifikasi(
          id, "Anda telah berhasil melakukan pembaharuan akun!");
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
