class DesaFavoritModel {
  final int id;
  final int id_desawisata;
  final int id_akun;
  final DateTime createdAt;
  final DateTime updatedAt;


  DesaFavoritModel({
    required this.id,
    required this.id_desawisata,
    required this.id_akun,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DesaFavoritModel.fromJson(Map<String, dynamic> json) {
    return DesaFavoritModel(
      id: json['id'],
      id_desawisata: json['id_desawisata'],
      id_akun: json['id_akun'],
      createdAt:  DateTime.parse(json['createdAt']),
      updatedAt:  DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_desawisata': id_desawisata,
      'id_akun': id_akun,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
