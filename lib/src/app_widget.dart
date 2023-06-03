import 'package:flutter/material.dart';
import 'package:openkaraoke/src/themes/themes.dart';
import 'package:openkaraoke/src/view/home/home_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: themeDefault,
    );
  }
}
