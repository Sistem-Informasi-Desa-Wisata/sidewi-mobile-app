class ReviewModel {
  final int id;
  final int id_akun;
  final int id_destinasiwisata;
  final int rating;
  final String review;
  final int setujui;
  final DateTime createdAt;
  final DateTime updatedAt;
  String? userName;
  String? foto;

  ReviewModel({
    required this.id,
    required this.id_akun,
    required this.id_destinasiwisata,
    required this.rating,
    required this.review,
    required this.setujui,
    required this.createdAt,
    required this.updatedAt,
    this.userName,
    this.foto,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      id_akun: json['id_akun'],
      id_destinasiwisata: json['id_destinasiwisata'],
      rating: json['rating'],
      review: json['review'],
      setujui: json['setujui'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      userName: json['userName'],
      foto: json['foto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_akun': id_akun,
      'id_destinasiwisata': id_destinasiwisata,
      'rating': rating,
      'review': review,
      'setujui': setujui,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'userName': userName,
      'foto': foto,
    };
  }

  @override
  String toString() {
    return 'ReviewModel(id: $id, id_akun: $id_akun,id_destinasiwisata:$id_destinasiwisata, review: $review,setujui:$setujui, rating: $rating, createdAt: $createdAt,username:$userName,foto:$foto)';
  }
}
