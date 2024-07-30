class DestinasiFavoritModel {
  final int id;
  final int id_destinasiwisata;
  final int id_akun;
  final DateTime createdAt;
  final DateTime updatedAt;


  DestinasiFavoritModel({
    required this.id,
    required this.id_destinasiwisata,
    required this.id_akun,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DestinasiFavoritModel.fromJson(Map<String, dynamic> json) {
    return DestinasiFavoritModel(
      id: json['id'],
      id_destinasiwisata: json['id_destinasiwisata'],
      id_akun: json['id_akun'],
      createdAt:  DateTime.parse(json['createdAt']),
      updatedAt:  DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_destinasiwisata': id_destinasiwisata,
      'id_akun': id_akun,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
