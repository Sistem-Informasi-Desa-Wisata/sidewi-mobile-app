import 'package:sidewi_mobile_app/models/request/register_request_model.dart';
import 'package:sidewi_mobile_app/models/response/register_response_model.dart';
import 'package:sidewi_mobile_app/services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<RegisterResponse> register(RegisterRequest request) {
    return apiService.register(request);
  }
}
