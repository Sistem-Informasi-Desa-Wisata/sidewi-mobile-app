class KategoriDestinasiModel {
  final int id;
  final String nama;
  final DateTime createdAt;
  final DateTime updatedAt;

  KategoriDestinasiModel({
    required this.id,
    required this.nama,
    required this.createdAt,
    required this.updatedAt,
  });

  factory KategoriDestinasiModel.fromJson(Map<String, dynamic> json) {
    return KategoriDestinasiModel(
      id: json['id'],
      nama: json['nama'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
