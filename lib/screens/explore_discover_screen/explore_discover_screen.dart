import 'package:device_explorer/components/side_menu/side_menu.dart';
import 'package:device_explorer/components/side_menu/widgets/side_menu_button.dart';
import 'package:device_explorer/controller/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class ExploreDiscoverScreen extends StatelessWidget {
  final ThemeProvider theme;
  final GlobalKey<ScaffoldState> menuKey = GlobalKey<ScaffoldState>();

  ExploreDiscoverScreen({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: menuKey,
      floatingActionButton: SideMenuButton(
        menuKey: menuKey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      drawer: SideMenu(theme: theme),
    );
  }
}
