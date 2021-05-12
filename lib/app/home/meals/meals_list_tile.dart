import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsListTile extends StatelessWidget {
  final Meal meal;
  final VoidCallback? onTap;

  const MealsListTile({
    Key? key,
    required this.meal,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        meal.mealName,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
