import 'package:morsmat/services/api_path.dart';
import 'package:morsmat/services/firestore_service.dart';

import '../app/home/models/meal.dart';

abstract class Database {
  Future<void> createMeal(Meal mealData);
  Stream<List<Meal>>? mealsStream();
}

class FireStoreDatabase implements Database {
  final String uid;

  FireStoreDatabase({required this.uid});

  final _service = FirestoreService.instance;

  @override
  Stream<List<Meal>> mealsStream() => _service.collectionStream(
        path: APIPath.meals(uid: uid),
        builder: (data) => Meal.fromMap(data),
      );

  @override
  Future<void> createMeal(Meal meal) => _service.setData(
        path: APIPath.meal(uid: uid, mealId: 'meal_123'),
        data: meal.toMap(),
      );
}
