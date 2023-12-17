import 'package:device_explorer/controller/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class SwitchComponent extends StatefulWidget {
  final ThemeProvider theme;

  const SwitchComponent({
    super.key,
    required this.theme,
  });

  @override
  State<SwitchComponent> createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.check,
          color: Color(0xffa7c7fc),
        );
      }
      return const Icon(
        Icons.close,
        color: Color(0xFF001428),
      );
    },
  );

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Color(0xffa7c7fc);
    }
    return const Color(0xFF001428);
  });

  final MaterialStateProperty<Color?> thumbColor =
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Color(0xFF001428);
    }
    return Colors.white;
  });

  final MaterialStateProperty<Color?> trackOutlineColor =
      MaterialStateProperty.resolveWith(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return null;
      }
      return Colors.white;
    },
  );

  final MaterialStateProperty<Color?> overlayColor =
      MaterialStateProperty.resolveWith(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff94befb).withOpacity(0.5);
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      overlayColor: overlayColor,
      trackOutlineColor: trackOutlineColor,
      trackColor: trackColor,
      thumbIcon: thumbIcon,
      thumbColor: thumbColor,
      value: widget.theme.isDarkMode,
      onChanged: (value) {
        widget.theme.toggleTheme();
      },
    );
  }
}
