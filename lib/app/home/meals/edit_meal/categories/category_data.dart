import 'package:flutter/cupertino.dart';
import 'package:morsmat/app/home/models/meal.dart';

import 'category_model.dart';

class CategoryData extends ChangeNotifier {
  List<CategoryModel> _categoryItems = [
    CategoryModel(
      id: 'Breakfast',
      categName: 'Breakfast',
      // categValue: false,
    ),
    CategoryModel(
      id: 'Lunch',
      categName: 'Lunch',
      // categValue: false,
    ),
    CategoryModel(
      id: 'Dinner',
      categName: 'Dinner',
      // categValue: false,
    ),
    CategoryModel(
      id: 'Pastry',
      categName: 'Pastry',
      // categValue: false,
    ),
    CategoryModel(
      id: 'Soup',
      categName: 'Soup',
      // categValue: false,
    ),
    CategoryModel(
      id: 'Vegan',
      categName: 'Vegan',
      // categValue: false,
    ),
    CategoryModel(
      id: 'Halal',
      categName: 'Halal',
      // categValue: false,
    ),
  ];

  List<CategoryModel> get categoryItems => [..._categoryItems];

  void changeCategValue(String id, bool value) {
    _categoryItems.map((item) {
      if (item.id == id) {
        item.categValue = value;
        notifyListeners();
      }
    });
  }

  @override
  String toString() {
    return _categoryItems.map((e) => e.categValue).toString();
  }
}
