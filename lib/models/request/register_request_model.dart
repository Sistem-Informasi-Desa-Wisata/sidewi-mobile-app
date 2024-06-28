class RegisterRequest {
  final String nama;
  final String no_telp;
  final String email;
  final String password;

  // final File? foto;

  RegisterRequest({
    required this.nama,
    required this.no_telp,
    required this.email,
    required this.password,

    // required this.foto
  });

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'no_telp': no_telp,
      'email': email,
      'password': password,

      // 'foto': foto
    };
  }
}
