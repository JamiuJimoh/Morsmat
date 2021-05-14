import 'package:flutter/material.dart';
import 'package:morsmat/app/home/cupertino_home_scaffold.dart';

import 'meals/meals_overview_page.dart';
import 'tab_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.meals;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.meals: (_) => MealsOverviewPage(),
      TabItem.orders: (_) => Container(),
      TabItem.account: (_) => Container(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
