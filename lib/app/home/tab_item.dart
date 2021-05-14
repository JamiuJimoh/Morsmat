import 'package:flutter/material.dart';

enum TabItem { meals, orders, account }

class TabItemData {
  final String title;
  final IconData icon;

  const TabItemData({
    required this.title,
    required this.icon,
  });

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.meals: TabItemData(title: 'Meals', icon: Icons.food_bank),
    TabItem.orders: TabItemData(title: 'Orders', icon: Icons.receipt),
    TabItem.account: TabItemData(title: 'Account', icon: Icons.person),
  };
}
