// lib/model/notification.dart

class Notification {
  final int id;
  final String deskripsi;
  final int status;
  final int idAkun;
  final DateTime createdAt;
  final DateTime updatedAt;

  Notification({
    required this.id,
    required this.deskripsi,
    required this.status,
    required this.idAkun,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      deskripsi: json['deskripsi'],
      status: json['status'],
      idAkun: json['id_akun'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
