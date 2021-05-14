import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tab_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;

  const CupertinoHomeScaffold({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
    required this.widgetBuilders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _buildItem(TabItem.meals, context),
          _buildItem(TabItem.orders, context),
          _buildItem(TabItem.account, context),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final item = TabItem.values[index];
        return CupertinoTabView(
          builder: (context) => widgetBuilders[item]!(context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, BuildContext context) {
    final itemData = TabItemData.allTabs[tabItem];
    final color = currentTab == tabItem
        ? Theme.of(context).accentColor
        : Theme.of(context).colorScheme.onSurface;
    return BottomNavigationBarItem(
      icon: Icon(itemData?.icon, color: color, size: 35.0),
      label: itemData?.title,
    );
  }
}
