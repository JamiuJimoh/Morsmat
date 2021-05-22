
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

  // return [
  //   CategoryItemContainer(
  //     borderColor: borderColor,
  // svgAssetName: 'assets/images/breakfast.svg',
  // categName: 'Breakfast',
  //   ),
  //   CategoryItemContainer(
  //     borderColor: borderColor,
  // svgAssetName: 'assets/images/lunch.svg',
  // categName: 'Lunch',
  //   ),
  //   CategoryItemContainer(
  //     borderColor: borderColor,
  // svgAssetName: 'assets/images/omelette.svg',
  // categName: 'Dinner',
  //   ),
  //   CategoryItemContainer(
  //     borderColor: borderColor,
  // svgAssetName: 'assets/images/croissant.svg',
  // categName: 'Pastry',
  //   ),
  //   CategoryItemContainer(
  //     borderColor: borderColor,
  // svgAssetName: 'assets/images/sour-soup.svg',
  // categName: 'Soup',
  //   ),
  //   CategoryItemContainer(
  //     borderColor: borderColor,
  // svgAssetName: 'assets/images/salad.svg',
  // categName: 'Vegan',
  //   ),
  //   CategoryItemContainer(
  //     borderColor: borderColor,
  // svgAssetName: 'assets/images/halal.svg',
  // categName: 'Halal',
  //   ),
  // ];

}
