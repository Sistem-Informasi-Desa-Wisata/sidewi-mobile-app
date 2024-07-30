class NotifikasiModel {
  final int id;
  final int id_akun;
  final String deskripsi;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotifikasiModel({
    required this.id,
    required this.id_akun,
    required this.status,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotifikasiModel.fromJson(Map<String, dynamic> json) {
    return NotifikasiModel(
      id: json['id'],
      id_akun: json['id_akun'],
      deskripsi: json['deskripsi'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_akun': id_akun,
      'deskripsi': deskripsi,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
