import 'package:blend_buddy/screen/tab_view.dart';
import 'package:flutter/material.dart';

import 'general/w_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: mainColor,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          useMaterial3: true,
          //scaffoldBackgroundColor: Colors.pink,
        ),
        home: const TabView(),
    );
  }
}