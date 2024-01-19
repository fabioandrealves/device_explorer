import 'dart:ui';

import 'package:device_explorer/components/side_menu/widgets/dish_logo.dart';
import 'package:device_explorer/components/side_menu/widgets/side_menu_item.dart';
import 'package:device_explorer/controller/theme/theme_provider.dart';
import 'package:device_explorer/style/percentage_extension.dart';
import 'package:flutter/material.dart';

import 'enum/menu_item_enum.dart';

class SideMenu extends StatefulWidget {
  final ThemeProvider theme;

  const SideMenu({
    super.key,
    required this.theme,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  MenuItem selectedMenuItem = MenuItem.dish;

  Widget _buildVerticalSpacing(
      {required double height, required double factor}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * factor.percent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Drawer(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(top: screenHeight * 9.67.percent()),
            child: ListView.builder(
              itemCount: 2 + MenuItem.values.length + 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const DishLogo();
                } else if (index == 1) {
                  return _buildVerticalSpacing(
                      height: screenHeight, factor: 2.17);
                } else if (index == 5) {
                  return _buildVerticalSpacing(
                      height: screenHeight, factor: 2.17);
                } else if (index == 6) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 5.0.percent(),
                    ),
                    child: const Divider(),
                  );
                } else if (index == 7) {
                  return _buildVerticalSpacing(
                      height: screenHeight, factor: 2.17);
                }

                final menuItem = index == 2
                    ? MenuItem.dish
                    : index == 3
                        ? MenuItem.salad
                        : index == 4
                            ? MenuItem.dessert
                            : MenuItem.drink;

                return SideMenuItem(
                  item: menuItem,
                  selectedMenuItem: selectedMenuItem,
                  autoClose: false,
                  onTap: () {
                    setState(() {
                      selectedMenuItem = menuItem;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
