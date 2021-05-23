
import 'category_model.dart';

class CategoryData {
  List<CategoryModel> _categoryItems = [
    CategoryModel(
      assetName: 'assets/images/breakfast.svg',
      categName: 'Breakfast',
    ),
    CategoryModel(
      assetName: 'assets/images/lunch.svg',
      categName: 'Lunch',
    ),
    CategoryModel(
      assetName: 'assets/images/omelette.svg',
      categName: 'Dinner',
    ),
    CategoryModel(
      assetName: 'assets/images/croissant.svg',
      categName: 'Pastry',
    ),
    CategoryModel(
      assetName: 'assets/images/sour-soup.svg',
      categName: 'Soup',
    ),
    CategoryModel(
      assetName: 'assets/images/salad.svg',
      categName: 'Vegan',
    ),
    CategoryModel(
      assetName: 'assets/images/halal.svg',
      categName: 'Halal',
    ),
  ];

  List<CategoryModel> get categoryItems => [..._categoryItems];

  int get itemLength => _categoryItems.length;

  String itemAssetName(int index) => categoryItems[index].assetName;

  String itemCategName(int index) => categoryItems[index].categName;


}
