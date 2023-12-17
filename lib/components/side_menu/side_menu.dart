import 'dart:ui';

import 'package:device_explorer/components/side_menu/widgets/device_logo.dart';
import 'package:device_explorer/components/side_menu/widgets/side_menu_item.dart';
import 'package:device_explorer/components/switch/switch_component.dart';
import 'package:device_explorer/controller/theme/theme_provider.dart';
import 'package:device_explorer/style/app_text_styles.dart';
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
  MenuItem selectedMenuItem = MenuItem.design;

  Widget buildSizedBox() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 2.17.percent(),
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
              itemCount: 2 + MenuItem.values.length + 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const DeviceLogo();
                } else if (index == 1) {
                  return buildSizedBox();
                } else if (index == 5) {
                  return buildSizedBox();
                } else if (index == 6) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 5.0.percent(),
                    ),
                    child: const Divider(),
                  );
                } else if (index == 7) {
                  return buildSizedBox();
                } else if (index == 8) {
                  return ListTile(
                    dense: false,
                    contentPadding: EdgeInsets.only(
                      left: screenWidth * 7.41.percent(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Toggle theme:",
                          style:
                              AppTextStyles.sideMenuItemTextStyle(fontSize: 16),
                        ),
                        SwitchComponent(
                          theme: widget.theme,
                        )
                      ],
                    ),
                  );
                }

                final menuItem = index == 2
                    ? MenuItem.design
                    : index == 3
                        ? MenuItem.camera
                        : index == 4
                            ? MenuItem.battery
                            : MenuItem.deviceSpecs;

                return SideMenuItem(
                  item: menuItem,
                  selectedMenuItem: selectedMenuItem,
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
