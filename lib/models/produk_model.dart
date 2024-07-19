class ProdukModel {
  final int id;
  final String deskripsi;
  final String nama;
  final String slug;
  final String gambar;
  final int harga;
  final int idDesaWisata;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProdukModel({
    required this.id,
    required this.deskripsi,
    required this.nama,
    required this.slug,
    required this.gambar,
    required this.harga,
    required this.idDesaWisata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id: json['id'],
      deskripsi: json['deskripsi'],
      nama: json['nama'],
      slug: json['slug'],
      gambar: json['gambar'],
      harga: json['harga'],
      idDesaWisata: json['id_desawisata'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deskripsi': deskripsi,
      'nama': nama,
      'slug': slug,
      'gambar': gambar,
      'harga': harga,
      'id_desawisata': idDesaWisata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
