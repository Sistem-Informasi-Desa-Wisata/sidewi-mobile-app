class UserModel {
  final int id;
  final String nama;
  final String email;
  final String? foto;
  final String role;
  final String no_telp;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    this.foto,
    required this.role,
    required this.no_telp,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      foto: json['foto'],
      role: json['role'],
      no_telp: json['no_telp'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'foto': foto,
      'role': role,
      'no_telp': no_telp,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
