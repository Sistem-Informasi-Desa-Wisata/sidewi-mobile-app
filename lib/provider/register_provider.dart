import 'package:flutter/material.dart';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';
import 'package:sidewi_mobile_app/repository/user_repository.dart';

import '../services/auth_service.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepository _repository;

  // Constructor RegisterProvider
  RegisterProvider(APIService apiService)
      : _repository = RegisterRepository(apiService);

  late RegisterResponseModel _response;
  bool _isLoading = false;

  RegisterResponseModel get response => _response;
  bool get isLoading => _isLoading;

  Future<void> register(RegisterRequestModel request) async {
    _isLoading = true;
    notifyListeners();

    try {
      _response = await _repository.register(request);
    } catch (e) {
      print('Error during registration: $e');
      _response =
          RegisterResponseModel(success: false, message: 'Failed to register');
    }

    _isLoading = false;
    notifyListeners();
  }
}
