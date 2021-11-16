import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/screens/add_new_market_screen.dart';
import 'package:flutter_movies_app_ex/screens/edit_market_screen.dart';
import 'package:flutter_movies_app_ex/screens/market_details_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes App',
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ))),
      home: HomeScreen(),
      routes: {
        ClothesDetailsScreen.routeName: (ctx) => ClothesDetailsScreen(),
        AddNewClothesScreen.routeName: (ctx) => AddNewClothesScreen(),
        EditClothesScreen.routeName: (ctx) => EditClothesScreen(),
      },
    );
  }
}
