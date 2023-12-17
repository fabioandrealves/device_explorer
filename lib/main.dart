import 'package:device_explorer/controller/theme/theme_provider.dart';
import 'package:device_explorer/screens/explore_discover_screen/explore_discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        themeMode: ThemeMode.system,
        title: 'Flutter Demo',
        theme: themeProvider.isDarkMode == false
            ? ThemeData.light()
            : ThemeData.dark(),
        home: ExploreDiscoverScreen(
          theme: themeProvider,
        ),
      );
    });
  }
}
