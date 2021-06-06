import 'package:morsmat/app/home/meals/meal_user_favorite.dart';
import 'package:morsmat/app/home/models/favorite.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';

import '../models/meal.dart';
import '../../../services/database.dart';

class MealsListViewModel {
  final Database database;

  MealsListViewModel({required this.database});

  // TO COMBINE THE STREAM OF MEALS AND STREAM OF FAVORITES TO DISPLAY THE MEALS WHILST DISPLAYING IF THAT SAME MEAL AS ALREADY BEEN CHECKED AS FAVORITE.

  Stream<List<MealUserFavorite>> get allMealsStream => Rx.combineLatest2(
        database.mealsStream(),
        database.favoriteMealsStream(),
        _mealsAndFavoritesCombiner,
      );

  static List<MealUserFavorite> _mealsAndFavoritesCombiner(
      List<Meal> meals, List<FavoriteMeal?> userFavorites) {
    return meals.map((meal) {
      final userFavorite = userFavorites.firstWhereOrNull(
        (userFavorite) => userFavorite?.mealId == meal.mealId,
        // orElse: () => null,
      );
      // final favoriteMeal = favoriteMeals.firstWhere(
      //   (favoriteMeal) {
      //     print('==========================');
      //     print('Favorite meal id : ${favoriteMeal.mealId}');
      //     print('Meal id : ${meal.mealId}');
      //     print('***************************');
      //     print('${favoriteMeal.mealId} == ${meal.mealId}');
      //     print('${favoriteMeal.mealId == meal.mealId}');
      //     print('==========================');
      //     return favoriteMeal.mealId == meal.mealId;
      //   },
      //   orElse: () => ()=> null,
      // );

      return MealUserFavorite(
        meal: meal,
        isFavorite: userFavorite?.isFavorite ?? false,
      );
    }).toList();
  }
}
