import 'package:flutter/material.dart';
import 'package:morsmat/app/home/models/meal.dart';
import 'package:provider/provider.dart';

import 'category_checkbox_list_tile.dart';
import 'category_data.dart';
import 'category_model.dart';

// enum Categories { breakfast, lunch, dinner, pastry, soup, vegan, halal }

class CategoryCheckboxListBuilder extends StatelessWidget {
  final CategoryData categoryData;
  final Meal? meal;

  const CategoryCheckboxListBuilder({
    Key? key,
    required this.meal,
    required this.categoryData,
  }) : super(key: key);
  // final Map<String, bool> categories = {
  //   'Breakfast': false,
  //   'Lunch': false,
  //   'Dinner': false,
  //   'Pastry': false,
  //   'Soup': false,
  //   'Vegan': false,
  //   'Halal': false,
  // };

  // Categories. .map((cat)=>categories.values);

  static Widget create(BuildContext context, {required Meal? meal}) {
    return ChangeNotifierProvider<CategoryData>(
      create: (_) => CategoryData(),
      child: Consumer<CategoryData>(
        builder: (_, categoryData, __) => CategoryCheckboxListBuilder(
          categoryData: categoryData,
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final categories = Provider.of<CategoryData>(context, listen: false);
    // return ListView.builder(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   itemBuilder: (context, index) {
    //     return CategoryCheckboxListTile(
    //       categoryName: Categories.values[index].toString(),
    //     );
    //   },
    //   itemCount: Categories.values.length,
    // );
    return Column(
      children: [
        ...categoryData.categoryItems
            .map(
              (category) => CategoryCheckboxListTile(
                categoryId: category.id,
                categoryName: category.categName,
                categoryValue: category.categValue,
                mealCategories: meal?.categories ?? null,
              ),
            )
            .toList(),
      ],
    );
  }
}
