import 'package:device_explorer/style/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../enum/menu_item_enum.dart';

class SideMenuItemString extends StatelessWidget {
  final MenuItem item;
  final MenuItem selectedMenuItem;

  const SideMenuItemString({
    super.key,
    required this.item,
    required this.selectedMenuItem,
  });

  String getItemString(MenuItem item) {
    switch (item) {
      case MenuItem.dish:
        return "Dishes";
      case MenuItem.salad:
        return "Salads";
      case MenuItem.dessert:
        return "Desserts";
      case MenuItem.drink:
        return "Drinks";
    }
  }

  TextStyle getItemTextStyle(MenuItem selectedMenuItem, MenuItem item) {
    return selectedMenuItem == item
        ? AppTextStyles.sideMenuItemSelectedTextStyle(fontSize: 16)
        : AppTextStyles.sideMenuItemTextStyle(fontSize: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getItemString(item),
      style: getItemTextStyle(selectedMenuItem, item),
    );
  }
}
