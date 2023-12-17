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
      case MenuItem.design:
        return "Design";
      case MenuItem.camera:
        return "Camera";
      case MenuItem.battery:
        return "Battery";
      case MenuItem.deviceSpecs:
        return "Specs";
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
