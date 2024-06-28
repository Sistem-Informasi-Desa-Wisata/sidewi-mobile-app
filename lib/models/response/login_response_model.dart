class LoginResponse {
  final String accessToken;

  LoginResponse({required this.accessToken});

  factory LoginResponse.fromJson(String accessToken) {
    return LoginResponse(accessToken: accessToken);
  }
}
