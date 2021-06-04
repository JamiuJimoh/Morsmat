import 'package:flutter/material.dart';
import 'package:morsmat/app/home/models/meal.dart';
import 'package:provider/provider.dart';

import 'category_checkbox_tile_container.dart';
import 'category_data.dart';
import 'category_model.dart';

class CategoryCheckboxListTile extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final Meal? meal;
  bool? categValue;

  CategoryCheckboxListTile({
    Key? key,
    required this.categoryId,
    required this.categoryName,
    required this.meal,
    this.categValue: false,
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
          value: widget.categValue,
          // onChanged: (value) {
          //   // setState(() => categoryValue = value);
          //   categoryData.categValue = categoryId;
          //   print(value);
          //   print(categoryId);
          // },
          onChanged: (value) {
            // setState(() {
            //   _value = value;
            // });

            // // TODO: CONTINUE
            // if (_value && widget.meal != null) {
            Provider.of<CategoryData>(context, listen: false)
                .changeCategValue(widget.categoryId, value!);
            //     .addCategoryToMeal(
            //   widget.meal,
            //   _value,
            //   categoryItem,
            // );
            // }

            print(widget.categoryId);
            print(_value);
          },
        ),
      ),
    );
  }
}
