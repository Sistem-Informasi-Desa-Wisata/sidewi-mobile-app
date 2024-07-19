class BeritaModel {
  final int id;
  final String judul;
  final String gambar;
  final String isiBerita;
  final String slug;
  final int idDesaWisata;
  final DateTime createdAt;
  final DateTime updatedAt;

  BeritaModel({
    required this.id,
    required this.judul,
    required this.gambar,
    required this.isiBerita,
    required this.slug,
    required this.idDesaWisata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      id: json['id'],
      judul: json['judul'],
      gambar: json['gambar'],
      isiBerita: json['isi_berita'],
      slug: json['slug'],
      idDesaWisata: json['id_desawisata'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'gambar': gambar,
      'isi_berita': isiBerita,
      'slug': slug,
      'id_desawisata': idDesaWisata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
