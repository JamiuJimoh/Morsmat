import 'package:flutter/cupertino.dart';

import 'category_model.dart';

class CategoryData extends ChangeNotifier {
  List<CategoryModel> _categoryItems = [
    CategoryModel(
      id: 'Breakfast',
      categName: 'Breakfast',
      categValue: false,
    ),
    CategoryModel(
      id: 'Lunch',
      categName: 'Lunch',
      categValue: false,
    ),
    CategoryModel(
      id: 'Dinner',
      categName: 'Dinner',
      categValue: false,
    ),
    CategoryModel(
      id: 'Pastry',
      categName: 'Pastry',
      categValue: false,
    ),
    CategoryModel(
      id: 'Soup',
      categName: 'Soup',
      categValue: false,
    ),
    CategoryModel(
      id: 'Vegan',
      categName: 'Vegan',
      categValue: false,
    ),
    CategoryModel(
      id: 'Halal',
      categName: 'Halal',
      categValue: false,
    ),
  ];

  List<CategoryModel> get categoryItems => [..._categoryItems];

  void categValue(String id, value) {
    _categoryItems.map((catItem) {
      if (catItem.id == id) {
        catItem.categValue = !catItem.categValue;
        catItem.categName = 'selected';
      }
    }).toList();
    notifyListeners();
  }

  // int get itemLength => _categoryItems.length;

  // String itemAssetName(int index) => categoryItems[index].assetName;

  // String itemCategName(int index) => categoryItems[index].categName;
  @override
  String toString() {
    return _categoryItems.map((e) => e.categValue).toString();
  }
}
