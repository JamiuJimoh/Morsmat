import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_checkbox_tile_container.dart';
import 'category_data.dart';
import 'category_model.dart';

class CategoryCheckboxListTile extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final bool? categoryValue;
  final List<CategoryModel>? mealCategories;

  const CategoryCheckboxListTile({
    Key? key,
    required this.categoryId,
    required this.categoryName,
    required this.categoryValue,
    required this.mealCategories,
  }) : super(key: key);

  @override
  _CategoryCheckboxListTileState createState() =>
      _CategoryCheckboxListTileState();
}

class _CategoryCheckboxListTileState extends State<CategoryCheckboxListTile> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CategoryCheckboxTileContainer(
        borderColor: Theme.of(context).colorScheme.onSurface,
        child: CheckboxListTile(
          title: Text(
            widget.categoryName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          value: _value,
          // onChanged: (value) {
          //   // setState(() => categoryValue = value);
          //   categoryData.categValue = categoryId;
          //   print(value);
          //   print(categoryId);
          // },
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            widget.mealCategories?.map((category) {
              // TODO: CONTINUE
              // if(category){

              // }
            });
            print(widget.categoryId);
            print(_value);
          },
        ),
      ),
    );
  }
}
