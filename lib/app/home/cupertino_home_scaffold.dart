import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tab_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  const CupertinoHomeScaffold({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
    required this.widgetBuilders,
    required this.navigatorKeys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Theme.of(context).accentColor,
        border: Border(
          top: BorderSide(
              color: Theme.of(context).colorScheme.onSurface, width: 0.6),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconSize: 35.0,
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
          navigatorKey: navigatorKeys[item],
          builder: (context) => widgetBuilders[item]!(context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, BuildContext context) {
    final itemData = TabItemData.allTabs[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(itemData?.icon),
      label: itemData?.title,
    );
  }
}
