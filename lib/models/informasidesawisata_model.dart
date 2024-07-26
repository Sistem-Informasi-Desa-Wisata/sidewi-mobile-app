class InformasiDesaWisataModel {
  final int id;
  final String no_telp;
  final String no_wa;
  final String facebook;
  final String instagram;
  final String website;
  final String email;
  final String id_desawisata;
  final String createdAt;
  final String updatedAt;

  InformasiDesaWisataModel({
    required this.id,
    required this.no_telp,
    required this.no_wa,
    required this.facebook,
    required this.instagram,
    required this.website,
    required this.email,
    required this.id_desawisata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InformasiDesaWisataModel.fromJson(Map<String, dynamic> json) {
    return InformasiDesaWisataModel(
      id: json['id'],
      no_telp: json['no_telp'],
      no_wa: json['no_wa'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      website: json['website'],
      email: json['email'],
      id_desawisata: json['id_desawisata'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'no_telp': no_telp,
      'no_wa': no_wa,
      'facebook': facebook,
      'instagram': instagram,
      'website': website,
      'email': email,
      'id_desawisata': id_desawisata,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
