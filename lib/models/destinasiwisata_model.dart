class DestinasiWisataModel {
  final int id;
  final String nama;
  final String slug;
  final String gambar;
  final String deskripsi;
  final int id_kategoridestinasi;
  final int id_desawisata;
  final DateTime createdAt;
  final DateTime updatedAt;

  DestinasiWisataModel({
    required this.id,
    required this.nama,
    required this.slug,
    required this.gambar,
    required this.deskripsi,
    required this.id_kategoridestinasi,
    required this.id_desawisata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DestinasiWisataModel.fromJson(Map<String, dynamic> json) {
    return DestinasiWisataModel(
      id: json['id'],
      nama: json['nama'],
      slug: json['slug'],
      gambar: json['gambar'],
      deskripsi: json['deskripsi'],
      id_kategoridestinasi: json['id_kategoridestinasi'],
      id_desawisata: json['id_desawisata'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'slug': slug,
      'gambar': gambar,
      'deskripsi': deskripsi,
      'id_kategoridestinasi': id_kategoridestinasi,
      'id_desawisata': id_desawisata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
