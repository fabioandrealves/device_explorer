import 'package:device_explorer/style/percentage_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../enum/menu_item_enum.dart';

class SideMenuItemIcon extends StatelessWidget {
  final MenuItem item;
  final MenuItem selectedMenuItem;

  const SideMenuItemIcon(
      {super.key, required this.item, required this.selectedMenuItem});

  String getIconTheme(MenuItem selectedMenuItem, MenuItem item) {
    return selectedMenuItem == item ? "blue" : "black";
  }

  String iconPath(MenuItem item) {
    final theme = getIconTheme(selectedMenuItem, item);
    switch (item) {
      case MenuItem.dish:
        return "assets/images/side_menu/ic_dish_$theme.png";
      case MenuItem.salad:
        return "assets/images/side_menu/ic_salad_$theme.png";
      case MenuItem.dessert:
        return "assets/images/side_menu/ic_dessert_$theme.png";
      case MenuItem.drink:
        return "assets/images/side_menu/ic_drink_$theme.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Image(
      width: screenWidth * 6.02.percent(),
      image: AssetImage(iconPath(item)),
    );
  }
}
