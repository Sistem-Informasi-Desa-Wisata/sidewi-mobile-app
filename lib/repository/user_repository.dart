import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';
import 'package:sidewi_mobile_app/services/auth_service.dart';

class RegisterRepository {
  final APIService _apiService;

  RegisterRepository(this._apiService);

  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    try {
      return await _apiService.register(request);
    } catch (e) {
      print('Error during registration: $e');
      throw Exception('Failed to register');
    }
  }
}
