class DesaWisataModel {
  final int id;
  final String gambar;
  final String alamat;
  final String nama;
  final String deskripsi;
  final String maps;
  final String kategori;
  final String kabupaten;
  final String slug;
  final String createdAt;
  final String updatedAt;

  DesaWisataModel({
    required this.id,
    required this.alamat,
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.maps,
    required this.kategori,
    required this.kabupaten,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DesaWisataModel.fromJson(Map<String, dynamic> json) {
    return DesaWisataModel(
      id: json['id'],
      alamat: json['alamat'],
      nama: json['nama'],
      gambar: json['gambar'],
      deskripsi: json['deskripsi'],
      maps: json['maps'],
      kategori: json['kategori'],
      kabupaten: json['kabupaten'],
      slug: json['slug'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alamat': alamat,
      'nama': nama,
      'gambar': gambar,
      'deskripsi': deskripsi,
      'maps': maps,
      'kategori': kategori,
      'kabupaten': kabupaten,
      'slug': slug,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
