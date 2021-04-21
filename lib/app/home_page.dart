import 'package:flutter/material.dart';
import 'meals_overview/meals_overview_page.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return MealsOverviewPage();
  }
}
