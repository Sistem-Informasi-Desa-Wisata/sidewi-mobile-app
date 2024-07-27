class ReviewModel {
  final int id;
  final int id_akun;
  final int id_destinasiwisata;
  int _rating;
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
    required int rating,
    required this.review,
    required this.setujui,
    required this.createdAt,
    required this.updatedAt,
    this.userName,
    this.foto,
  }) : _rating = (rating < 1)
            ? 1
            : (rating > 5)
                ? 5
                : rating;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    int rating = json['rating'];
    return ReviewModel(
      id: json['id'],
      id_akun: json['id_akun'],
      id_destinasiwisata: json['id_destinasiwisata'],
      rating: (rating < 1)
          ? 1
          : (rating > 5)
              ? 5
              : rating,
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
      'rating': _rating,
      'review': review,
      'setujui': setujui,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'userName': userName,
      'foto': foto,
    };
  }

  int get rating => _rating;

  set rating(int newRating) {
    if (newRating < 1) {
      _rating = 1;
    } else if (newRating > 5) {
      _rating = 5;
    } else {
      _rating = newRating;
    }
  }

  @override
  String toString() {
    return 'ReviewModel(id: $id, id_akun: $id_akun, id_destinasiwisata: $id_destinasiwisata, review: $review, setujui: $setujui, rating: $_rating, createdAt: $createdAt, updatedAt: $updatedAt, userName: $userName, foto: $foto)';
  }
}
