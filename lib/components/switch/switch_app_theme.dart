import 'package:device_explorer/controller/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class SwitchAppTheme extends StatefulWidget {
  final ThemeProvider theme;

  const SwitchAppTheme({
    super.key,
    required this.theme,
  });

  @override
  State<SwitchAppTheme> createState() => _SwitchAppThemeState();
}

class _SwitchAppThemeState extends State<SwitchAppTheme> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      }
      return const Icon(
        Icons.close,
        color: Colors.red,
      );
    },
  );

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Color(0xffa7c7fc);
    }
    return const Color(0xFF22306A);
  });

  final MaterialStateProperty<Color?> thumbColor =
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Color(0xFF22306A);
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
