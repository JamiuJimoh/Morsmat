class FavoriteMeal {
  final String mealId;
  final bool isFavorite;

  FavoriteMeal({required this.mealId, required this.isFavorite});

  factory FavoriteMeal.fromMap(Map<String, dynamic> data, String documentId) {
    print(documentId);

    final mealId = documentId;
    final isFavorite = data['$mealId'];
    return FavoriteMeal(mealId: mealId, isFavorite: isFavorite);
  }

  Map<String, dynamic> toMap() {
    return {
      '$mealId': isFavorite,
    };
  }
}
