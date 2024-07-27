import 'package:first_firebase_connection/ui/screen/match_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _themeData(),
      home: const MatchList(),

    );
  }
  ThemeData _themeData(){
    return ThemeData(
      elevatedButtonTheme:ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(double.maxFinite),
          padding: const EdgeInsets.symmetric(vertical: 12)
        )
      )
    );
  }
}
