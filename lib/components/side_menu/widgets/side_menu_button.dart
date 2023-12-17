import 'package:flutter/material.dart';

class SideMenuButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> menuKey;

  const SideMenuButton({super.key, required this.menuKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          menuKey.currentState!.openDrawer();
        },
        child: const Icon(
          Icons.menu,
          color: Color(0xFF001428),
        ),
      ),
    );
  }
}
