import 'package:sidewi_mobile_app/models/request/login_request_model.dart';
import 'package:sidewi_mobile_app/models/request/logout_request_model.dart';
import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/response/login_response_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';
import 'package:sidewi_mobile_app/models/response/logout_response_model.dart';
import 'package:sidewi_mobile_app/services/api_service.dart';

// api service
// Data dari provider dikirim ke service(API)

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<RegisterResponse> register(RegisterRequest request) {
    return apiService.register(request);
  }

  Future<LoginResponse> login(LoginRequest request) {
    return apiService.login(request);
  }
  Future<LogoutResponse> logout() {
    return apiService.logout();
  }
}
