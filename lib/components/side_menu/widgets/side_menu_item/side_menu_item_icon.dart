import 'package:device_explorer/style/percentage_extension.dart';
import 'package:flutter/cupertino.dart';

import '../../enum/menu_item_enum.dart';

class SideMenuItemIcon extends StatelessWidget {
  final MenuItem item;
  final MenuItem selectedMenuItem;

  const SideMenuItemIcon(
      {super.key, required this.item, required this.selectedMenuItem});

  String getIconTheme(MenuItem selectedMenuItem, MenuItem item) {
    return selectedMenuItem == item ? "blue" : "dark";
  }

  String iconPath(MenuItem item) {
    final theme = getIconTheme(selectedMenuItem, item);
    switch (item) {
      case MenuItem.design:
        return "assets/images/side_menu/ic_design_$theme.png";
      case MenuItem.camera:
        return "assets/images/side_menu/ic_camera_$theme.png";
      case MenuItem.battery:
        return "assets/images/side_menu/ic_battery_$theme.png";
      case MenuItem.deviceSpecs:
        return "assets/images/side_menu/ic_specs_$theme.png";
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
