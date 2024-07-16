class DesaWisata {
  final int id;
  final String nama;
  final String slug;
  final String alamat;
  final String gambar;
  final String deskripsi;
  final String maps;
  final String kategori;
  final String kabupaten;
  final DateTime createdAt;
  final DateTime updatedAt;

  DesaWisata({
    required this.id,
    required this.nama,
    required this.slug,
    required this.alamat,
    required this.gambar,
    required this.deskripsi,
    required this.maps,
    required this.kategori,
    required this.kabupaten,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DesaWisata.fromJson(Map<String, dynamic> json) {
    return DesaWisata(
      id: json['id'],
      nama: json['nama'],
      slug: json['slug'],
      alamat: json['alamat'],
      gambar: json['gambar'],
      deskripsi: json['deskripsi'],
      maps: json['maps'],
      kategori: json['kategori'],
      kabupaten: json['kabupaten'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
