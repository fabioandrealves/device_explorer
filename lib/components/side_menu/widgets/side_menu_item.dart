import 'package:device_explorer/components/side_menu/widgets/side_menu_item/side_menu_item_icon.dart';
import 'package:device_explorer/components/side_menu/widgets/side_menu_item/side_menu_item_string.dart';
import 'package:device_explorer/style/percentage_extension.dart';
import 'package:flutter/material.dart';

import '../enum/menu_item_enum.dart';

class SideMenuItem extends StatelessWidget {
  final MenuItem item;
  final MenuItem selectedMenuItem;
  final VoidCallback onTap;

  const SideMenuItem({
    super.key,
    required this.item,
    required this.selectedMenuItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(
            left: screenWidth * 7.41.percent(),
          ),
          leading: SideMenuItemIcon(
            item: item,
            selectedMenuItem: selectedMenuItem,
          ),
          title: SideMenuItemString(
            item: item,
            selectedMenuItem: selectedMenuItem,
          ),
          trailing: Container(
            color: item == selectedMenuItem
                ? const Color(0xff0E77DA)
                : Colors.transparent,
            width: 5.0,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
