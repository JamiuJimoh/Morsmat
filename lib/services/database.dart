import 'package:morsmat/app/home/models/favorite.dart';
import 'package:morsmat/services/api_path.dart';
import 'package:morsmat/services/firestore_service.dart';

import '../app/home/models/meal.dart';

abstract class Database {
  Future<void> setMeal(Meal mealData);
  Stream<List<Meal>> mealsStream();
  Future<void> deleteMeal(Meal meal);
  Stream<List<FavoriteMeal>> favoriteMealsStream();
  Future<void> setFavoriteMeal(Meal meal, FavoriteMeal favoriteMeal);
  Future<void> deleteFavoriteMeal(Meal meal);
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FireStoreDatabase implements Database {
  final String uid;

  FireStoreDatabase({required this.uid});

  final _service = FirestoreService.instance;

  @override
  Stream<List<Meal>> mealsStream() => _service.collectionStream<Meal>(
        path: APIPath.meals(),
        builder: (data, documentId) => Meal.fromMap(data, documentId),
      );

  @override
  Future<void> setMeal(Meal meal) => _service.setData(
        path: APIPath.meal(mealId: meal.mealId),
        data: meal.toMap(),
      );

  @override
  Future<void> deleteMeal(Meal meal) => _service.deleteData(
        path: APIPath.meal(mealId: meal.mealId),
      );

  @override
  Stream<List<FavoriteMeal>> favoriteMealsStream() => _service.collectionStream<FavoriteMeal>(
        path: APIPath.favoriteMeals(uid: uid),
        builder: (data, documentId) => FavoriteMeal.fromMap(data, documentId),
      );

  @override
  Future<void> setFavoriteMeal(Meal meal, FavoriteMeal favoriteMeal) =>
      _service.setData(
        path: APIPath.favoriteMeal(uid: uid, mealId: meal.mealId),
        data: favoriteMeal.toMap(),
      );

  @override
  Future<void> deleteFavoriteMeal(Meal meal) => _service.deleteData(
        path: APIPath.favoriteMeal(uid: uid, mealId: meal.mealId),
      );
}
