import '../models/meal.dart';

class MealUserFavorite {
  MealUserFavorite({
    required this.meal,
    required this.isFavorite,
  });
  final Meal meal;
  final bool isFavorite;
}
