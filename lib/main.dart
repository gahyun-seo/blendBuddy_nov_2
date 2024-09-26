import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/screen/home/s_home.dart';
import 'package:blend_buddy/screen/tab_view.dart';
import 'package:flutter/material.dart';

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
            backgroundColor: thirdColor,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          scaffoldBackgroundColor: mainBackgroundColor,
        ),
        home: TabView(),
    );
  }
}
// 깃허브 테스트 1