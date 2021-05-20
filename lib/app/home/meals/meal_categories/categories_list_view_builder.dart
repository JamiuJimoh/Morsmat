import 'package:flutter/material.dart';

import 'category_data.dart';
import 'category_item_container.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  final categoryData = CategoryData();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(7.0),
          child: CategoryItemContainer(
            onPressed: () {},
            borderColor: Theme.of(context).colorScheme.secondary.withAlpha(30),
            svgAssetName: categoryData.itemAssetName(index),
            categName: categoryData.itemCategName(index),
          ),
        ),
        itemCount: categoryData.itemLength,
      ),
    );
  }
}
