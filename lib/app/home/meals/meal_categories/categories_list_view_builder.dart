import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        itemBuilder: (context, index) => Row(
          children: [
            CategoryItemContainer(
              onPressed: () {},
              borderColor:
                  Theme.of(context).colorScheme.secondary.withAlpha(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(categoryData.itemAssetName(index),
                      height: 40.0, width: 40.0),
                  const SizedBox(height: 10),
                  Text(categoryData.itemCategName(index)),
                ],
              ),
            ),
            const SizedBox(width: 15.0),
          ],
        ),
        itemCount: categoryData.itemLength,
      ),
    );
  }
}
