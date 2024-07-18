class DesaFavoriteModel {
  final int id;
  final int id_desawisata;
  final int id_akun;
  final int createdAt;
  final int updatedAt;


  DesaFavoriteModel({
    required this.id,
    required this.id_desawisata,
    required this.id_akun,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DesaFavoriteModel.fromJson(Map<String, dynamic> json) {
    return DesaFavoriteModel(
      id: json['id'],
      id_desawisata: json['id_desawisata'],
      id_akun: json['id_akun'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_desawisata': id_desawisata,
      'id_akun': id_akun,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
